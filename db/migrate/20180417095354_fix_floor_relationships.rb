class FixFloorRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_reference :workrooms, :building, foreign_key: true
    remove_reference :contributors, :building, index: true
    add_reference :workrooms, :floor, foreign_key: true

    add_reference :contributors, :site, foreign_key: true
  end
end
