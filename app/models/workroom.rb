class Workroom < ApplicationRecord
  belongs_to :floor
  has_many :workplaces

  def to_s
    "#{code} - #{name}"
  end
end
