json.array!(@responses) do |response|
  json.extract! response, :id, :question_id, :reviewer_id, :answer_option, :comment
  json.url response_url(response, format: :json)
end
