json.array!(@questions) do |question|
  json.extract! question, :id, :title, :body, :user
  json.url question_url(question, format: :json)
end
