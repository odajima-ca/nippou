json.array!(@tasks) do |task|
  json.extract! task, :id, :category_id, :name, :description, :status, :completed_at
  json.url task_url(task, format: :json)
end
