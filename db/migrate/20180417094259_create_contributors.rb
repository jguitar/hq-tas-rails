class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.string :code
      t.string :first_name
      t.string :surname
      t.references :business_unit, foreign_key: false
      t.references :workplace, foreign_key: false
      t.references :workroom, foreign_key: false
      t.references :building, foreign_key: false

      t.timestamps
    end
  end
end
