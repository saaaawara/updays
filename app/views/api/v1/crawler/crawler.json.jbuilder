json.array! @events do |event|
    json.place event["place"]
    json.symd event["symd"]
    json.eymd event["eymd"]
    json.name event["name"]
    json.url event["url"]
    json.jenre @categry
end

# json.set! :event, @events


    # json.array! @events do |event|
        # json[i]["place"] event["0"]["place"]
    # end
# @events.each do |event|
#     json.place event["place"]
# end