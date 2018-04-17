class BusinessUnit < ApplicationRecord
  def to_s
    "#{code} - #{name}"
  end
end
