class Instructor < ApplicationRecord
  has_many :activity, dependent: :destroy
  has_one_attached :image


  def displayed_image
    if image.attached?
      image.variant(resize_to_fit: [290, 350])
    else
      'default_profile.jpg'
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end
