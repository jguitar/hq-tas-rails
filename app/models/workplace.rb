class Workplace < ApplicationRecord
  belongs_to :workroom
  has_one :contributor

  def to_s
    code
  end
end
