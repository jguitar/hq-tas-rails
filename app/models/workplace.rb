class Workplace < ApplicationRecord
  belongs_to :workroom

  def to_s
    "#{code} - #{name}"
  end
end
