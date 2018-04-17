class Workroom < ApplicationRecord
  belongs_to :floor

  def to_s
    "#{code} - #{name}"
  end
end
