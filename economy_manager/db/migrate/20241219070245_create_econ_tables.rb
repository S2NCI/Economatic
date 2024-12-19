class CreateEconTables < ActiveRecord::Migration[7.2]
  def change
    create_table :econ_tables do |t|
      t.string :acronym
      t.string :name
      t.string :imgUrl
      t.integer :gross
      t.integer :trade
      t.integer :expenditure
      t.integer :reserve
      t.string :status
      t.integer :co
      t.integer :iso
      t.integer :ant
      t.integer :state
      t.integer :ind

      t.timestamps
    end
  end
end
