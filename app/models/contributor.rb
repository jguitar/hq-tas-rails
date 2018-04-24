class Contributor < ApplicationRecord
  belongs_to :business_unit
  belongs_to :site
  belongs_to :workroom
  belongs_to :workplace

  scope :without_workplace, -> { where(workplace: nil) }
  scope :without_workroom, -> { where(workroom: nil) }
  scope :unassigned, -> { without_workplace.or(without_workroom) }

  def to_s
    "#{last_name.upcase} #{first_name}"
  end
end
