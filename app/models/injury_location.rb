class InjuryLocation < ApplicationRecord
  has_many :treatments
  has_one_attached :photo
end
