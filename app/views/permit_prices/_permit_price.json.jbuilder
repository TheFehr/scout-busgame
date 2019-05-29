# frozen_string_literal: true

json.extract! permit_price, :id, :price, :permit_id, :created_at, :updated_at
json.url permit_price_url(permit_price, format: :json)
