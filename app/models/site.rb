class Site < ApplicationRecord
  has_many :buildings

  def to_s
    name
  end
end
