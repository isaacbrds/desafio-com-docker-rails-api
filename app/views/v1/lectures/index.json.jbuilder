json.lectures do
  json.array! @lectures, :id, :title
end