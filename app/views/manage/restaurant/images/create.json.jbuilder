json.id @image.id
json.url do
  json.s @image.image.url("50x50")
  json.m @image.image.url("140x140")
  json.b @image.image.url("500x500")
end
json.is_cover @image.is_cover ? "是" : "否"
json.created_at formattime(@image.created_at)
