class Activity < ApplicationRecord
  belongs_to :instructor
  has_one_attached :image
  has_many :time_slot, dependent: :delete_all

  def displayed_image
    if image.attached?
      image
    else
      'default_profile.jpg'
    end
  end

  def instructor
    Instructor.find(self.instructor_id)
  end
end
