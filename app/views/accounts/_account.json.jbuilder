json.extract! account, :id, :nombre, :descripcion, :tipo_cuenta, :tipo_familiar, :created_at, :updated_at
json.url account_url(account, format: :json)
