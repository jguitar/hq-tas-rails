class Floor < ApplicationRecord
  belongs_to :building
  has_many :workrooms

  def to_s
    code
  end

  def occupation
    over_occupation_count + assigned_count
  end

  def capacity
    workplaces.count
  end

  protected

  def workplaces
    Workplace.where(workroom_id: workroom_ids)
  end

  def over_occupation_count
    Contributor.without_workplace.where(workroom_id: workroom_ids).count
  end

  def assigned_count
    Contributor.where(workplace: workplaces).count
  end
end
