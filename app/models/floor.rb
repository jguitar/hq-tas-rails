class Floor < ApplicationRecord
  belongs_to :building

  def to_s
    "#{code} - #{name}"
  end
end
