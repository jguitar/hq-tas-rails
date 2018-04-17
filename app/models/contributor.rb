class Contributor < ApplicationRecord
  belongs_to :business_unit
  belongs_to :site
  belongs_to :workroom
  belongs_to :workplace

  def to_s
    "#{last_name.upcase} #{first_name}"
  end
end
