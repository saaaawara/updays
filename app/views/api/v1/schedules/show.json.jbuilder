if @schedule_count != 0
    json.array! @schedules do |schedule|
        json.contents schedule.contents
        json.date schedule.date
        json.jenre schedule.jenre
        json.event_count @has_event_count
        json.achieve_count @achieve_count
    end
else
    json.set! :event_count, @has_event_count
    json.set! :achieve_count, @achieve_count
end