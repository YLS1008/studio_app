class Instructor < ApplicationRecord

  has_many :activities, dependent: :destroy
  has_many :time_slots, through: :activities
  has_many :notifications, dependent: :destroy
  has_one_attached :image
  has_one_attached :logo


  def displayed_image
    if image.attached?
      image.variant(resize_to_fit: [290, 350])
    else
      'default_profile.jpg'
    end
  end

  def displayed_logo
    if logo.attached?
      logo.variant(resize_to_fit: [120, 120])
    else
      'default_profile.jpg'
    end
  end

  def full_name
    self.first.capitalize + ' ' + self.last.capitalize
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end
