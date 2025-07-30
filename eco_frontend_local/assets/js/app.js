// Base URL for the Rails API
const apiBaseUrl = "http://localhost:3000";

// Fetch entries for the selected table type
async function loadEntries() {
  const tableType = document.getElementById('table-type').value;
  const entrySelect = document.getElementById('entry-select');

  // Clear previous entries
  entrySelect.innerHTML = '<option value="" selected disabled>Choose an entry</option>';

  try {
    const res = await fetch(`${apiBaseUrl}/${tableType}_tables.json`);
    const data = await res.json();

    data.forEach((entry) => {
      const option = document.createElement('option');
      option.value = entry.id;
      option.textContent = `${entry.acronym} - ${entry.name}`;
      entrySelect.appendChild(option);
    });
  } catch (err) {
    console.error('Error loading entries:', err);
  }
}

// Fetch and display details for the selected entry
function loadEntryDetails() {
  const tableType = document.getElementById('table-type').value;
  const entryId = document.getElementById('entry-select').value;

  fetch(`${apiBaseUrl}/${tableType}_tables/${entryId}.json`)
    .then((res) => res.json())
    .then((data) => {
      document.getElementById('entry-details').classList.remove('d-none');
      document.getElementById('detail-acronym').textContent = data.acronym;
      document.getElementById('detail-name').textContent = data.name;
      document.getElementById('detail-gross').textContent = `$${data.gross.toLocaleString()}`;
      document.getElementById('detail-trade').textContent = `$${data.trade.toLocaleString()}`;
      document.getElementById('detail-expenditure').textContent = `$${data.expenditure.toLocaleString()}`;
      document.getElementById('detail-reserve').textContent = `$${data.reserve.toLocaleString()}`;
      document.getElementById('detail-deficit').textContent = `$${data.deficit.toLocaleString()}`;
    })
    .catch((err) => console.error('Error loading entry details:', err));
}



// Function to handle form submission
const createEconTable = async (event) => {
  event.preventDefault(); // Prevent the form from submitting the traditional way

  // Gather values from form fields
  const acronym = document.getElementById('acronym').value;
  const name = document.getElementById('name').value;
  const gross = document.getElementById('gross').value; // Remove commas for numeric processing
  const trade = document.getElementById('trade').value;
  const expenditure = document.getElementById('expenditure').value;
  const reserve = document.getElementById('reserve').value;
  const status = document.getElementById('status').value;
  const state = document.getElementById('state').value;
  const ind = document.getElementById('ind').value;
  const ant = document.getElementById('ant').value;
  const iso = document.getElementById('iso').value;
  const co = document.getElementById('co').value;

  // Create an object to send to the server
  const formData = {
    acronym,
    name,
    gross,
    trade,
    expenditure,
    reserve,
    status,
    ant,
    iso,
    co,
    state,
    ind
  };

  try {
    // Make a POST request to the server with form data
    const response = await fetch(`${apiBaseUrl}/econ_tables`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formData)
    });

    // Check if the request was successful
    if (response.ok) {
      const data = await response.json();
      console.log('Success:', data); // Handle success (e.g., display a message)
      alert('Entry created successfully');
    } else {
      throw new Error('Failed to create entry');
    }
  } catch (error) {
    console.error('Error:', error); // Handle errors (e.g., network failure)
    alert('Error creating entry');
  }
};



// Function to populate EconTable
const populateEconTables = () => {
  fetch(`${apiBaseUrl}/econ_tables`)
    .then(response => response.json())
    .then(data => {
      const econTableBody = document.querySelector("#econ-tables tbody");
      econTableBody.innerHTML = ""; // Clear previous rows

      data.forEach((row) => {
        const tableRow = `
          <tr>
            <td>${row.acronym}</td>
            <td>${row.name}</td>
            <td>${row.gross}</td>
            <td>
              <a href="${apiBaseUrl}/econ_tables/${row.id}/edit" class="btn btn-primary btn-sm">Edit</a>
              <a href="${apiBaseUrl}/econ_tables/${row.id}" class="btn btn-secondary btn-sm">View</a>
            </td>
          </tr>
        `;
        econTableBody.innerHTML += tableRow;
      });
    })
    .catch(error => console.error("Error fetching Econ Tables:", error));
};

// Function to populate AiTable
const populateAiTables = () => {
  fetch(`${apiBaseUrl}/ai_tables`)
    .then(response => response.json())
    .then(data => {
      const aiTableBody = document.querySelector("#ai-tables tbody");
      aiTableBody.innerHTML = ""; // Clear previous rows

      data.forEach((row) => {
        const tableRow = `
          <tr>
            <td>${row.acronym}</td>
            <td>${row.name}</td>
            <td>${row.gross}</td>
            <td>
              <a href="${apiBaseUrl}/ai_tables/${row.id}/edit" class="btn btn-primary btn-sm">Edit</a>
              <a href="${apiBaseUrl}/ai_tables/${row.id}" class="btn btn-secondary btn-sm">View</a>
            </td>
          </tr>
        `;
        aiTableBody.innerHTML += tableRow;
      });
    })
    .catch(error => console.error("Error fetching AI Tables:", error));
};

if (typeof module !== 'undefined') {
  module.exports = {
    loadEntries,
    loadEntryDetails,
    createEconTable,
    populateEconTables,
    populateAiTables
  };
}