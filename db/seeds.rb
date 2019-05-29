# frozen_string_literal: true

require_relative 'seed_data/bus_lines'
require_relative 'seed_data/zones'
require_relative 'seed_data/positions'
require_relative 'seed_data/bus_stops'

# Group.create!(
#   name: 'Gruppe 1',
#   phone: '076 123 45 67'
# )
#
# Group.create!(
#   name: 'Gruppe 2',
#   phone: '076 123 45 67'
# )
#
# Group.create!(
#   name: 'Gruppe 3',
#   phone: '076 123 45 67'
# )

Permit.create!(
  kind: :short
)

Permit.create!(
  kind: :long
)

PermitPrice.create!(
  permit: Permit.first,
  price: 10
)

PermitPrice.create!(
  permit: Permit.last,
  price: 30
)
