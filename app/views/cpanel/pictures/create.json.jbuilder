json.id @picture.id
json.url do
  json.s @picture.image.url("50x50")
  json.m @picture.image.url("140x140")
  json.b @picture.image.url("500x500")
end
json.is_cover @picture.is_cover ? "是" : "否"
json.created_at formattime(@picture.created_at)
