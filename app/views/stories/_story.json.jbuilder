json.extract! story, :id, :number, :title, :planned_on, :estimated_points, :real_points, :dev_done_on, :created_at, :updated_at
json.url story_url(story, format: :json)