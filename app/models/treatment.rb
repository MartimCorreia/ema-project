class Treatment < ApplicationRecord
  belongs_to :injury_location
  belongs_to :injury_type
  belongs_to :condition
  has_many :patients
  has_one_attached :images
  has_many :procedures
  has_many :medical_reports, dependent: :destroy
end
