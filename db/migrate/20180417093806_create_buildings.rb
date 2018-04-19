class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :code
      t.string :name
      t.references :site, foreign_key: false

      t.timestamps
    end
  end
end
