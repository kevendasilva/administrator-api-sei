class Vacancy < ApplicationRecord
  belongs_to :parking, dependent: :destroy
  enum kind: {
    small: 0,
    medium: 1,
    large: 2,
    special: 3,
    motorcycle: 4
  }
end
