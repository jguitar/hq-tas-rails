class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.string :code
      t.string :first_name
      t.string :last_name
      t.references :business_unit, foreign_key: true
      t.references :workplace, foreign_key: true
      t.references :workroom, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
