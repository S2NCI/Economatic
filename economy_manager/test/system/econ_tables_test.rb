require "application_system_test_case"

class EconTablesTest < ApplicationSystemTestCase
  setup do
    @econ_table = econ_tables(:one)
  end

  test "visiting the index" do
    visit econ_tables_url
    assert_selector "h1", text: "Econ tables"
  end

  test "should create econ table" do
    visit econ_tables_url
    click_on "New econ table"

    fill_in "Acronym", with: @econ_table.acronym
    fill_in "Ant", with: @econ_table.ant
    fill_in "Co", with: @econ_table.co
    fill_in "Expenditure", with: @econ_table.expenditure
    fill_in "Gross", with: @econ_table.gross
    fill_in "Imgurl", with: @econ_table.imgUrl
    fill_in "Ind", with: @econ_table.ind
    fill_in "Iso", with: @econ_table.iso
    fill_in "Name", with: @econ_table.name
    fill_in "Reserve", with: @econ_table.reserve
    fill_in "State", with: @econ_table.state
    fill_in "Status", with: @econ_table.status
    fill_in "Trade", with: @econ_table.trade
    click_on "Create Econ table"

    assert_text "Econ table was successfully created"
    click_on "Back"
  end

  test "should update Econ table" do
    visit econ_table_url(@econ_table)
    click_on "Edit this econ table", match: :first

    fill_in "Acronym", with: @econ_table.acronym
    fill_in "Ant", with: @econ_table.ant
    fill_in "Co", with: @econ_table.co
    fill_in "Expenditure", with: @econ_table.expenditure
    fill_in "Gross", with: @econ_table.gross
    fill_in "Imgurl", with: @econ_table.imgUrl
    fill_in "Ind", with: @econ_table.ind
    fill_in "Iso", with: @econ_table.iso
    fill_in "Name", with: @econ_table.name
    fill_in "Reserve", with: @econ_table.reserve
    fill_in "State", with: @econ_table.state
    fill_in "Status", with: @econ_table.status
    fill_in "Trade", with: @econ_table.trade
    click_on "Update Econ table"

    assert_text "Econ table was successfully updated"
    click_on "Back"
  end

  test "should destroy Econ table" do
    visit econ_table_url(@econ_table)
    click_on "Destroy this econ table", match: :first

    assert_text "Econ table was successfully destroyed"
  end
end
