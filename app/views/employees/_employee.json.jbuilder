json.extract! employee, :id, :name, :email, :position, :employee_number, :private_number, :created_at, :updated_at
json.url employee_url(employee, format: :json)
