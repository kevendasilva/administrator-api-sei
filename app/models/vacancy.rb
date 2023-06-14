class Vacancy < ApplicationRecord
  belongs_to :parking
  enum size: {
    small: 0,
    medium: 1,
    large: 2,
    special: 3,
    motorcycle: 4
  }
end
