class Contributor < ApplicationRecord
  belongs_to :business_unit
  belongs_to :workplace
  belongs_to :workroom
  belongs_to :building
end
