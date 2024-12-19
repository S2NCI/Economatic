require "application_system_test_case"

class AiTablesTest < ApplicationSystemTestCase
  setup do
    @ai_table = ai_tables(:one)
  end

  test "visiting the index" do
    visit ai_tables_url
    assert_selector "h1", text: "Ai tables"
  end

  test "should create ai table" do
    visit ai_tables_url
    click_on "New ai table"

    fill_in "Acronym", with: @ai_table.acronym
    fill_in "Ant", with: @ai_table.ant
    fill_in "Co", with: @ai_table.co
    fill_in "Gross", with: @ai_table.gross
    fill_in "Imgurl", with: @ai_table.imgUrl
    fill_in "Ind", with: @ai_table.ind
    fill_in "Iso", with: @ai_table.iso
    fill_in "Name", with: @ai_table.name
    fill_in "State", with: @ai_table.state
    fill_in "Trade", with: @ai_table.trade
    click_on "Create Ai table"

    assert_text "Ai table was successfully created"
    click_on "Back"
  end

  test "should update Ai table" do
    visit ai_table_url(@ai_table)
    click_on "Edit this ai table", match: :first

    fill_in "Acronym", with: @ai_table.acronym
    fill_in "Ant", with: @ai_table.ant
    fill_in "Co", with: @ai_table.co
    fill_in "Gross", with: @ai_table.gross
    fill_in "Imgurl", with: @ai_table.imgUrl
    fill_in "Ind", with: @ai_table.ind
    fill_in "Iso", with: @ai_table.iso
    fill_in "Name", with: @ai_table.name
    fill_in "State", with: @ai_table.state
    fill_in "Trade", with: @ai_table.trade
    click_on "Update Ai table"

    assert_text "Ai table was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai table" do
    visit ai_table_url(@ai_table)
    click_on "Destroy this ai table", match: :first

    assert_text "Ai table was successfully destroyed"
  end
end
