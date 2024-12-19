class EconTablesController < ApplicationController
  before_action :set_econ_table, only: %i[ show edit update destroy ]

  # GET /econ_tables or /econ_tables.json
  def index
    @econ_table = EconTable.all
  end

  # GET /econ_tables/1 or /econ_tables/1.json
  def show
  end

  # GET /econ_tables/new
  def new
    @econ_table = EconTable.new
  end

  # GET /econ_tables/1/edit
  def edit
  end

  # POST /econ_tables or /econ_tables.json
  def create
    @econ_table = EconTable.new(econ_table_params)

    respond_to do |format|
      if @econ_table.save
        format.html { redirect_to @econ_table, notice: "Econ table was successfully created." }
        format.json { render :show, status: :created, location: @econ_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @econ_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /econ_tables/1 or /econ_tables/1.json
  def update
    respond_to do |format|
      if @econ_table.update(econ_table_params)
        format.html { redirect_to @econ_table, notice: "Econ table was successfully updated." }
        format.json { render :show, status: :ok, location: @econ_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @econ_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /econ_tables/1 or /econ_tables/1.json
  def destroy
    @econ_table.destroy!

    respond_to do |format|
      format.html { redirect_to econ_tables_path, status: :see_other, notice: "Econ table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_econ_table
      @econ_table = EconTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def econ_table_params
      params.require(:econ_table).permit(:acronym, :name, :imgUrl, :gross, :trade, :expenditure, :reserve, :status, :co, :iso, :ant, :state, :ind)
    end
end
