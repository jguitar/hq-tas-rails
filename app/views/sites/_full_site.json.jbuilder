json.extract! site, :id, :code, :name, :contributors_without_workroom, :contributors_over_occupation, :contributors_assigned, :contributors_size
json.buildings site.buildings, partial: 'buildings/full_building', as: :building
