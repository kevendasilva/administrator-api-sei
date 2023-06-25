class Movement < ApplicationRecord
  belongs_to :vehicle, dependent: :destroy
  belongs_to :client, dependent: :destroy
end
