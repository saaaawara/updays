json.array! @dailies do |daily|
    json.user_id daily.user_id
    json.title daily.title
    json.comment daily.comment
    json.image daily.image
    # json.image daily.image.url
    json.date daily.date
    json.jenre daily.jenre
end