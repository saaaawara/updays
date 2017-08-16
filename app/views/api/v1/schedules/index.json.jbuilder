json.array! @schedules do |schedule|
    json.user_id schedule.user_id
    json.contents schedule.contents
    json.date schedule.date
    json.jenre schedule.jenre
end