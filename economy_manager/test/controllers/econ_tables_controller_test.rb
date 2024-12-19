require "test_helper"

class EconTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @econ_table = econ_tables(:one)
  end

  test "should get index" do
    get econ_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_econ_table_url
    assert_response :success
  end

  test "should create econ_table" do
    assert_difference("EconTable.count") do
      post econ_tables_url, params: { econ_table: { acronym: @econ_table.acronym, ant: @econ_table.ant, co: @econ_table.co, expenditure: @econ_table.expenditure, gross: @econ_table.gross, ind: @econ_table.ind, iso: @econ_table.iso, name: @econ_table.name, reserve: @econ_table.reserve, state: @econ_table.state, status: @econ_table.status, trade: @econ_table.trade } }
    end

    assert_redirected_to econ_table_url(EconTable.last)
  end

  test "should show econ_table" do
    get econ_table_url(@econ_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_econ_table_url(@econ_table)
    assert_response :success
  end

  test "should update econ_table" do
    patch econ_table_url(@econ_table), params: { econ_table: { acronym: @econ_table.acronym, ant: @econ_table.ant, co: @econ_table.co, expenditure: @econ_table.expenditure, gross: @econ_table.gross, ind: @econ_table.ind, iso: @econ_table.iso, name: @econ_table.name, reserve: @econ_table.reserve, state: @econ_table.state, status: @econ_table.status, trade: @econ_table.trade } }
    assert_redirected_to econ_table_url(@econ_table)
  end

  test "should destroy econ_table" do
    assert_difference("EconTable.count", -1) do
      delete econ_table_url(@econ_table)
    end

    assert_redirected_to econ_tables_url
  end
end
