class Parking < ApplicationRecord
  belongs_to :administrator
  has_many :vacancies, dependent: :destroy
end
