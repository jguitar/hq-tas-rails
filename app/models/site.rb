class Site < ApplicationRecord
  has_many :buildings

  def to_s
    "#{code} - #{name}"
  end
end
