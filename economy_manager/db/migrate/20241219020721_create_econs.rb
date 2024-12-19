class CreateEcons < ActiveRecord::Migration[7.2]
  def change
    create_table :econs do |t|
      t.timestamps
    end
  end
end
