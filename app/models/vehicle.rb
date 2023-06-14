class Vehicle < ApplicationRecord
  self.table_name = "vehicles"

  attribute :id
  attribute :nickname, :string
  attribute :plate, :string
  attribute :client_id
end