class Patient < ApplicationRecord
  belongs_to :treatment
  belongs_to :user
  has_one_attached :photo
  has_many :medical_reports, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true }
    }
end
