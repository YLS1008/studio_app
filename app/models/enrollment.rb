class Enrollment < ApplicationRecord
  belongs_to :trainee
  belongs_to :time_slot


end
