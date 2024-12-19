require "test_helper"

class EconTableTest < ActiveSupport::TestCase
  test "creates and retrieves a record" do
    # Create a new entry
    econ_entry = EconTable.create(
      acronym: "ABC",
      name: "Test Country",
      imgUrl: "http://example.com/img",
      gross: 500000,
      trade: 20000,
      expenditure: 150000,
      reserve: 80000,
      status: "Thrify",
      co: 50,
      iso: 75,
      ant: 30,
      state: 60,
      ind: 90
    )

    # Ensure the record is saved
    assert econ_entry.persisted?, "Record was not saved"

    # Retrieve the record
    retrieved_entry = EconTable.find_by(acronym: "ABC")
    assert_not_nil retrieved_entry, "Record not found"
    assert_equal "Test Country", retrieved_entry.name
    assert_equal "http://example.com/img", retrieved_entry.imgUrl
  end
end
