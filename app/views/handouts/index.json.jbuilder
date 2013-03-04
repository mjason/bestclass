json.array! handouts do |handout|
  json.(handout, :id, :title, :accessory)
end