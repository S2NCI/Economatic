class AiTablesController < ApplicationController
  before_action :set_ai_table, only: %i[ show edit update destroy ]

  # GET /ai_tables or /ai_tables.json
  def index
    @ai_tables = AiTable.all
  end

  # GET /ai_tables/1 or /ai_tables/1.json
  def show
  end

  # GET /ai_tables/new
  def new
    @ai_table = AiTable.new
  end

  # GET /ai_tables/1/edit
  def edit
  end

  # POST /ai_tables or /ai_tables.json
  def create
    @ai_table = AiTable.new(ai_table_params)

    respond_to do |format|
      if @ai_table.save
        format.html { redirect_to @ai_table, notice: "Ai table was successfully created." }
        format.json { render :show, status: :created, location: @ai_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_tables/1 or /ai_tables/1.json
  def update
    respond_to do |format|
      if @ai_table.update(ai_table_params)
        format.html { redirect_to @ai_table, notice: "Ai table was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_tables/1 or /ai_tables/1.json
  def destroy
    @ai_table.destroy!

    respond_to do |format|
      format.html { redirect_to ai_tables_path, status: :see_other, notice: "Ai table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_table
      @ai_table = AiTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ai_table_params
      params.require(:ai_table).permit(:acronym, :name, :imgUrl, :gross, :trade, :co, :iso, :ant, :state, :ind)
    end
end
