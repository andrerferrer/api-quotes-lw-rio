json.array! @people do |person|
  json.extract! person, :id, :name
end
