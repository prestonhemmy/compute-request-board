json.extract! compute_request, :id, :title, :gpu_count, :cpu_count, :memory_gb, :hours, :partition, :priority, :status, :notes, :created_at, :updated_at, :created_at, :updated_at
json.url compute_request_url(compute_request, format: :json)
