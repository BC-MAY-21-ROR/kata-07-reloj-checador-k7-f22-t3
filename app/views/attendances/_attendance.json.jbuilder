json.extract! attendance, :id, :employee_private_number, :check_in, :check_out, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
