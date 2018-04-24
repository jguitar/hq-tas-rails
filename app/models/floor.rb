class Floor < ApplicationRecord
  belongs_to :building
  has_many :workrooms

  def to_s
    code
  end
end
