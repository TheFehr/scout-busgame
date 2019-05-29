# frozen_string_literal: true

(1..5).to_a.each { |number| BusLine.create!(id: number) }
BusLine.create!(id: 7)
(9..10).each { |number| BusLine.create!(id: number) }
BusLine.create!(id: 12)
