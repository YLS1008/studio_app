class Activity < ApplicationRecord
  belongs_to :instructor
  has_one_attached :image
  has_many :groups, dependent: :destroy
  has_many :trainees, through: :groups
  has_many :time_slots, dependent: :destroy

  def displayed_image
      if image.attached?
        image.variant(resize_to_fit: [120, 120])
      else
        'default_profile.jpg'
      end
  end

  def instructor
    Instructor.find(self.instructor_id)
  end
end
