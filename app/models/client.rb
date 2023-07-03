class Client < ApplicationRecord
  self.table_name = "clients"

  has_many :movements, dependent: :destroy
  has_many :vehicles, dependent: :destroy

  attribute :id
  attribute :name
  attribute :email
end