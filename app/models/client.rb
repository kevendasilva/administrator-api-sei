class Client < ApplicationRecord
    self.table_name = "clients"
  
    attribute :id
    attribute :name
    attribute :email
  end