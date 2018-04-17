class Building < ApplicationRecord
  belongs_to :site
  has_many :floors

  def to_s
    "#{code} - #{name}"
  end
end
