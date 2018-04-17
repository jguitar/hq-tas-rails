class CreateWorkplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workplaces do |t|
      t.string :code
      t.string :name
      t.references :workroom, foreign_key: true

      t.timestamps
    end
  end
end
