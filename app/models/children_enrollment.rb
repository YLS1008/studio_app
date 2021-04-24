class ChildrenEnrollment < ApplicationRecord
  belongs_to :child
  belongs_to :time_slot
end
