json.person @person[:name].capitalize
json.quotes @person.quotes do |quote|
  json.extract! quote, :id, :content
end

# json.extract! @restaurant, :id, :name, :address
# json.comments @restaurant.comments do |comment|
#   json.extract! comment, :id, :content
# end
