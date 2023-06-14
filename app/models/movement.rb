class Movement < ApplicationRecord
  belongs_to :vehicle
  belongs_to :client
end
