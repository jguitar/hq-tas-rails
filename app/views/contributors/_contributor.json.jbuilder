json.extract! contributor, :id, :code, :first_name, :last_name
json.business_unit contributor.business_unit.to_s
json.workroom contributor.workroom.to_s
if contributor.workroom_id?
  json.floor contributor.workroom.floor.to_s
else
  json.floor nil
end
json.site contributor.site.to_s
json.url contributor_url(contributor, format: :json)
