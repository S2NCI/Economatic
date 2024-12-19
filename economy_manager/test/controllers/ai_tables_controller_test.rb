require "test_helper"

class AiTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_table = ai_table(:one)
  end

  test "should get index" do
    get ai_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_table_url
    assert_response :success
  end

  test "should create ai_table" do
    assert_difference("AiTable.count") do
      post ai_tables_url, params: { ai_table: { acronym: @ai_table.acronym, ant: @ai_table.ant, co: @ai_table.co, gross: @ai_table.gross, ind: @ai_table.ind, iso: @ai_table.iso, name: @ai_table.name, state: @ai_table.state, trade: @ai_table.trade } }
    end

    assert_redirected_to ai_table_url(AiTable.last)
  end

  test "should show ai_table" do
    get ai_table_url(@ai_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_table_url(@ai_table)
    assert_response :success
  end

  test "should update ai_table" do
    patch ai_table_url(@ai_table), params: { ai_table: { acronym: @ai_table.acronym, ant: @ai_table.ant, co: @ai_table.co, gross: @ai_table.gross, ind: @ai_table.ind, iso: @ai_table.iso, name: @ai_table.name, state: @ai_table.state, trade: @ai_table.trade } }
    assert_redirected_to ai_table_url(@ai_table)
  end

  test "should destroy ai_table" do
    assert_difference("AiTable.count", -1) do
      delete ai_table_url(@ai_table)
    end

    assert_redirected_to ai_tables_url
  end
end
