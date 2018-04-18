class RenameContributorsSurnameToLastName < ActiveRecord::Migration[5.2]
  def change
    rename_column :contributors, :surname, :last_name
  end
end
