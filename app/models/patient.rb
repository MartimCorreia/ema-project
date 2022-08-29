class Patient < ApplicationRecord
  belongs_to :treatment
  belongs_to :user
end
