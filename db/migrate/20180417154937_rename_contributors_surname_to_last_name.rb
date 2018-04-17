class RenameContributorslast_nameToLastName < ActiveRecord::Migration[5.2]
  def change
    rename_column :contributors, :last_name, :last_name
  end
end
