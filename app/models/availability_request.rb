class AvailabilityRequest < ApplicationRecord
  has_secure_token :api_token
  belongs_to :user
  belongs_to :availability_process
  has_many :availability_responses, dependent: :destroy
end
