class Parking < ApplicationRecord
  belongs_to :administrator, dependent: :destroy
  has_many :vacancies
end
