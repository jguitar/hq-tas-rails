class Contributor < ApplicationRecord
  belongs_to :business_unit
  belongs_to :site
  belongs_to :workroom
  belongs_to :workplace
end
