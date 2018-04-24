class Contributor < ApplicationRecord
  belongs_to :business_unit
  belongs_to :site
  belongs_to :workroom, optional: true
  belongs_to :workplace, optional: true

  scope :without_workplace, -> { where(workplace: nil) }
  scope :without_workroom, -> { where(workroom: nil) }
  scope :unassigned, -> { without_workplace.or(without_workroom) }
  scope :over_occupation, -> { where.not(workroom: nil).without_workplace }
  scope :assigned, -> { where.not(workplace: nil) }

  def to_s
    "#{last_name.upcase} #{first_name}"
  end
end
