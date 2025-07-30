/**
 * @jest-environment jsdom
 */

const {
  loadEntries,
  loadEntryDetails,
  createEconTable,
  populateEconTables,
  populateAiTables
} = require('./app');

beforeEach(() => {
  // Set up DOM elements your functions rely on
  document.body.innerHTML = `
    <select id="table-type">
      <option value="econ" selected>econ</option>
      <option value="ai">ai</option>
    </select>

    <select id="entry-select"></select>

    <div id="entry-details" class="d-none">
      <span id="detail-acronym"></span>
      <span id="detail-name"></span>
      <span id="detail-gross"></span>
      <span id="detail-trade"></span>
      <span id="detail-expenditure"></span>
      <span id="detail-reserve"></span>
      <span id="detail-deficit"></span>
    </div>

    <table id="econ-tables"><tbody></tbody></table>
    <table id="ai-tables"><tbody></tbody></table>

    <input id="acronym" />
    <input id="name" />
    <input id="gross" />
    <input id="trade" />
    <input id="expenditure" />
    <input id="reserve" />
    <input id="status" />
    <input id="state" />
    <input id="ind" />
    <input id="ant" />
    <input id="iso" />
    <input id="co" />
  `;

  // Mock fetch globally before each test
  global.fetch = jest.fn();

  // Mock alert globally for createEconTable test
  global.alert = jest.fn();
});

afterEach(() => {
  jest.resetAllMocks();
});

describe('app.js functions', () => {

  test('loadEntries populates the entry dropdown', async () => {
    // Arrange: mock fetch response with 2 entries
    fetch.mockResolvedValueOnce({
      ok: true,
      json: async () => [
        { id: 1, acronym: 'ABC', name: 'Test Economy' },
        { id: 2, acronym: 'DEF', name: 'Other Entry' }
      ]
    });

    // Act
    await loadEntries();

    // Assert
    const options = document.querySelectorAll('#entry-select option');
    expect(options.length).toBe(3); // 1 default + 2 fetched
    expect(options[0].textContent).toBe('Choose an entry');
    expect(options[1].textContent).toBe('ABC - Test Economy');
    expect(options[2].value).toBe('2');
  });

  test('loadEntryDetails fills in details and shows details div', async () => {
    // Arrange: set entry-select value and mock fetch details
    document.getElementById('entry-select').innerHTML = '<option value="1" selected>1</option>';

    fetch.mockResolvedValueOnce({
      ok: true,
      json: async () => ({
        acronym: 'ABC',
        name: 'Example Entry',
        gross: 1000,
        trade: 500,
        expenditure: 400,
        reserve: 100,
        deficit: 50
      })
    });

    // Act
    await loadEntryDetails();

    // Assert: details filled
    expect(document.getElementById('detail-name').textContent).toBe('Example Entry');
    expect(document.getElementById('detail-acronym').textContent).toBe('ABC');
    expect(document.getElementById('detail-gross').textContent).toBe('$1,000');
    expect(document.getElementById('detail-trade').textContent).toBe('$500');
    expect(document.getElementById('detail-expenditure').textContent).toBe('$400');
    expect(document.getElementById('detail-reserve').textContent).toBe('$100');
    expect(document.getElementById('detail-deficit').textContent).toBe('$50');

    // Assert: entry details div is visible
    expect(document.getElementById('entry-details').classList.contains('d-none')).toBe(false);
  });

  test('createEconTable sends POST and alerts on success', async () => {
    // Arrange: fill inputs with test values
    document.getElementById('acronym').value = 'XYZ';
    document.getElementById('name').value = 'Test Entry';
    document.getElementById('gross').value = '1234';
    document.getElementById('trade').value = '234';
    document.getElementById('expenditure').value = '345';
    document.getElementById('reserve').value = '456';
    document.getElementById('status').value = 'Stable';
    document.getElementById('state').value = 'Yes';
    document.getElementById('ind').value = 'IND';
    document.getElementById('ant').value = 'ANT';
    document.getElementById('iso').value = 'ISO';
    document.getElementById('co').value = 'CO';

    // Mock fetch POST success response
    fetch.mockResolvedValueOnce({
      ok: true,
      json: async () => ({ id: 1 })
    });

    // Act
    const fakeEvent = { preventDefault: jest.fn() };
    await createEconTable(fakeEvent);

    // Assert fetch called correctly
    expect(fetch).toHaveBeenCalledWith(expect.stringContaining('/econ_tables'), expect.objectContaining({
      method: 'POST',
      headers: { 'Content-Type': 'application/json' }
    }));

    // Assert alert called
    expect(global.alert).toHaveBeenCalledWith('Entry created successfully');
  });

  test('populateEconTables creates rows from data', async () => {
    // Arrange mock fetch response
    fetch.mockResolvedValueOnce({
      ok: true,
      json: async () => [
        { id: 1, acronym: 'ABC', name: 'A', gross: 1000 }
      ]
    });

    // Act
    await populateEconTables();

    // Assert
    const rows = document.querySelectorAll('#econ-tables tbody tr');
    expect(rows.length).toBe(1);
    expect(rows[0].innerHTML).toContain('ABC');
  });

  test('populateAiTables creates rows from data', async () => {
    // Arrange mock fetch response
    fetch.mockResolvedValueOnce({
      ok: true,
      json: async () => [
        { id: 2, acronym: 'XYZ', name: 'B', gross: 2000 }
      ]
    });

    // Act
    await populateAiTables();

    // Assert
    const rows = document.querySelectorAll('#ai-tables tbody tr');
    expect(rows.length).toBe(1);
    expect(rows[0].innerHTML).toContain('XYZ');
  });

});