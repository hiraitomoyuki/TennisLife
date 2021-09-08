json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :title, :description, :circle_id
  json.title schedule.title
  json.start schedule.start_date
  json.end schedule.end_date
  json.url schedule_url(schedule, circle_id: schedule.circle_id)
end
