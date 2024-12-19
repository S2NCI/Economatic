class TablesController < ApplicationController
  def index
    @econ_tables = EconTable.all
    @ai_tables = AiTable.all
  end
end
