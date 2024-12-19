require "test_helper"

class AiTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_tables = ai_tables(:one)
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
      post ai_tables_url, params: { ai_table: { acronym: @ai_tables.acronym, ant: @ai_tables.ant, co: @ai_tables.co, gross: @ai_tables.gross, imgUrl: @ai_tables.imgUrl, ind: @ai_tables.ind, iso: @ai_tables.iso, name: @ai_tables.name, state: @ai_tables.state, trade: @ai_tables.trade } }
    end

    assert_redirected_to ai_table_url(AiTable.last)
  end

  test "should show ai_table" do
    get ai_table_url(@ai_tables)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_table_url(@ai_tables)
    assert_response :success
  end

  test "should update ai_table" do
    patch ai_table_url(@ai_tables), params: { ai_table: { acronym: @ai_tables.acronym, ant: @ai_tables.ant, co: @ai_tables.co, gross: @ai_tables.gross, imgUrl: @ai_tables.imgUrl, ind: @ai_tables.ind, iso: @ai_tables.iso, name: @ai_tables.name, state: @ai_tables.state, trade: @ai_tables.trade } }
    assert_redirected_to ai_table_url(@ai_table)
  end

  test "should destroy ai_table" do
    assert_difference("AiTable.count", -1) do
      delete ai_table_url(@ai_tables)
    end

    assert_redirected_to ai_tables_url
  end
end
