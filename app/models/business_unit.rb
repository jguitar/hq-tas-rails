class BusinessUnit < ApplicationRecord
  has_many :contributors

  def to_s
    "#{code} - #{name}"
  end
end
