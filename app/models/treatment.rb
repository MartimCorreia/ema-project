class Treatment < ApplicationRecord
  belongs_to :injury_location
  belongs_to :injury_type
  belongs_to :condition
end
