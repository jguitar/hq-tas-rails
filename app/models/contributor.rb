class Contributor < ApplicationRecord
  belongs_to :business_unit
  belongs_to :site
  belongs_to :workroom
  belongs_to :workplace

  def to_s
    "#{surname.upcase} #{first_name}"
  end
end
