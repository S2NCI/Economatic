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
  // Reset DOM before each test
  document.body.innerHTML = '';
  fetch.resetMocks && fetch.resetMocks(); // if using jest-fetch-mock
});

global.fetch = jest.fn(); // Mock fetch globally

describe('app.js functions', () => {

  test('loadEntries populates the entry dropdown', async () => {
    document.body.innerHTML = `
      <select id="table-type"><option value="econ" selected>econ</option></select>
      <select id="entry-select"></select>
    `;

    fetch.mockResolvedValueOnce({
      json: async () => [
        { id: 1, acronym: 'ABC', name: 'Test Economy' },
        { id: 2, acronym: 'DEF', name: 'Other Entry' }
      ]
    });

    await loadEntries();

    const options = document.querySelectorAll('#entry-select option');
    expect(options.length).toBe(3); // default + 2 entries
    expect(options[1].textContent).toBe('ABC - Test Economy');
    expect(options[2].value).toBe('2');
  });

  test('loadEntryDetails fills in details', async () => {
    document.body.innerHTML = `
      <select id="table-type"><option value="econ" selected>econ</option></select>
      <select id="entry-select"><option value="1" selected>1</option></select>
      <div id="entry-details" class="d-none"></div>
      <span id="detail-acronym"></span>
      <span id="detail-name"></span>
      <span id="detail-gross"></span>
      <span id="detail-trade"></span>
      <span id="detail-expenditure"></span>
      <span id="detail-reserve"></span>
      <span id="detail-deficit"></span>
    `;

    fetch.mockResolvedValueOnce({
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

    await loadEntryDetails();

    expect(document.getElementById('detail-name').textContent).toBe('Example Entry');
    expect(document.getElementById('entry-details').classList.contains('d-none')).toBe(false);
  });

  test('createEconTable sends POST and alerts on success', async () => {
    document.body.innerHTML = `
      <form id="econ-form"></form>
      <input id="acronym" value="XYZ"/>
      <input id="name" value="Test Entry"/>
      <input id="gross" value="1234"/>
      <input id="trade" value="234"/>
      <input id="expenditure" value="345"/>
      <input id="reserve" value="456"/>
      <input id="status" value="Stable"/>
      <input id="state" value="Yes"/>
      <input id="ind" value="IND"/>
      <input id="ant" value="ANT"/>
      <input id="iso" value="ISO"/>
      <input id="co" value="CO"/>
    `;

    global.alert = jest.fn();

    fetch.mockResolvedValueOnce({
      ok: true,
      json: async () => ({ id: 1 })
    });

    const fakeEvent = { preventDefault: jest.fn() };
    await createEconTable(fakeEvent);

    expect(fetch).toHaveBeenCalledWith(expect.stringContaining('/econ_tables'), expect.objectContaining({
      method: 'POST'
    }));
    expect(alert).toHaveBeenCalledWith('Entry created successfully');
  });

  test('populateEconTables creates rows from data', async () => {
    document.body.innerHTML = `<table id="econ-tables"><tbody></tbody></table>`;

    fetch.mockResolvedValueOnce({
      json: async () => [
        { id: 1, acronym: 'ABC', name: 'A', gross: 1000 }
      ]
    });

    await populateEconTables();
    const rows = document.querySelectorAll('#econ-tables tbody tr');
    expect(rows.length).toBe(1);
    expect(rows[0].innerHTML).toContain('ABC');
  });

  test('populateAiTables creates rows from data', async () => {
    document.body.innerHTML = `<table id="ai-tables"><tbody></tbody></table>`;

    fetch.mockResolvedValueOnce({
      json: async () => [
        { id: 2, acronym: 'XYZ', name: 'B', gross: 2000 }
      ]
    });

    await populateAiTables();
    const rows = document.querySelectorAll('#ai-tables tbody tr');
    expect(rows.length).toBe(1);
    expect(rows[0].innerHTML).toContain('XYZ');
  });
});