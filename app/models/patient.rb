class Patient < ApplicationRecord
  belongs_to :treatment
  belongs_to :user
  has_one_attached :photo
  has_many :medical_reports, dependent: :destroy
end
