class Building < ApplicationRecord
  belongs_to :site

  def to_s
    "#{code} - #{name}"
  end
end
