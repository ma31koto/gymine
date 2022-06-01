class Post < ApplicationRecord
  belongs_to :area
  
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :address, presence: true, uniqueness: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :area_id, presence: true
  
  has_one_attached :post_image

  def get_post_image
    post_image.attached? ? post_image : 'no_image.jpg'
  end
end
