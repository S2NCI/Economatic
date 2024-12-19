class AiTable < ActiveRecord::Migration[7.2]
  def change
    create_table :econ_table do |t|
      t.string :acronym, limit: 3, null: false       # 3-character string (key)
      t.string :name, limit: 255                     # 255-character string
      t.string :imgUrl, limit: 255                   # Representational image URL string
      t.integer :gross                               # Integer field for gross annual
      t.integer :trade                               # Integer field for annual trade balance
      # non-trade expenditure calculated as maximum
      # no reserve
      t.string :status                               # Field with predefined values for adjustments

      # Ideological Fields      
      t.integer :co   
      t.integer :iso    
      t.integer :ant    
      t.integer :state   
      t.integer :ind

      t.timestamps                                  # Adds created_at and updated_at
    end
  end
end
