json.extract! building, :id, :code, :name
json.floors building.floors, partial: 'floors/full_floor', as: :floor
