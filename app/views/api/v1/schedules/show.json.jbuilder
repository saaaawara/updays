json.array! @schedules do |schedule|
    json.contents schedule.contents
    json.date schedule.date
    json.jenre schedule.jenre
end
# json.set! :user_id, @schedules.user_id