class Site < ApplicationRecord

  def to_s
    "#{code} - #{name}"
  end
end
