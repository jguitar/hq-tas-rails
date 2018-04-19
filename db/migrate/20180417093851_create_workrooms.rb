class CreateWorkrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :workrooms do |t|
      t.string :code
      t.string :name
      t.references :building, foreign_key: false

      t.timestamps
    end
  end
end
