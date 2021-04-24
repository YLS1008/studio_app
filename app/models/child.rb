class Child < ApplicationRecord
  belongs_to :trainee

  has_many :children_enrollments
  has_many :time_slots, through: :children_enrollments
end
