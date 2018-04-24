class Site < ApplicationRecord
  has_many :buildings
  has_many :contributors

  def to_s
    name
  end

  def contributors_without_workroom
    contributors.without_workroom.count
  end

  def contributors_over_occupation
    contributors.over_occupation.count
  end

  def contributors_assigned
    contributors.assigned.count
  end

  def contributors_size
    contributors.size
  end
end
