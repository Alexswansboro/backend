class AvailabilityResponse < ApplicationRecord
  belongs_to :availability_request
  belongs_to :shift
end
