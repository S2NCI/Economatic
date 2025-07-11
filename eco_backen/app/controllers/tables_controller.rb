class TablesController < ApplicationController
  protect_from_forgery with: :exception, unless: -> {request.format.json?}
  def index
    @econ_tables = EconTable.all
    @ai_tables = AiTable.all
  end
end
