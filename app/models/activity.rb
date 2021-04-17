class Activity < ApplicationRecord
  belongs_to :instructor
  has_one_attached :image
  has_many :time_slot

  def displayed_image
    if image.attached?
      image
    else
      'default_profile.jpg'
    end
  end
end
