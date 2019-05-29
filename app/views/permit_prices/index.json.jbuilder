# frozen_string_literal: true

json.array! @permit_prices, partial: 'permit_prices/permit_price', as: :permit_price
