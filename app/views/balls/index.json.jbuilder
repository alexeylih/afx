json.array!(@balls) do |ball|
  json.extract! ball, 
  json.url ball_url(ball, format: :json)
end
