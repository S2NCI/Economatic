class CreateAis < ActiveRecord::Migration[7.2]
  def change
    create_table :ais do |t|
      t.timestamps
    end
  end
end
