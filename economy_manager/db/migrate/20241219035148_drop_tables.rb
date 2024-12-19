class DropTables < ActiveRecord::Migration[7.2]
  # Destroy the data tables including any schema oldness
  def change
    
    drop_table :ai_table
    drop_table  :econ_table
  end
end
