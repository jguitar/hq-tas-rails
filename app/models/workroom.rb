class Workroom < ApplicationRecord
  belongs_to :floor
  has_many :workplaces

  def to_s
    code
  end

  def occupation
    over_occupation_count + assigned_count
  end

  def capacity
    workplaces.count
  end

  def overoccupated
    occupation > capacity
  end

  protected

  def over_occupation_count
    Contributor.without_workplace.where(workroom_id: id).count
  end

  def assigned_count
    Contributor.where(workplace: workplaces).count
  end
end
