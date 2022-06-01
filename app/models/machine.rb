class Machine < ApplicationRecord
  has_many :machine_types, dependent: :destroy
  has_many :post, through: :machine_types

  validates :name, presence: true, uniqueness: true
  
  has_one_attached :machine_image

  def get_pmachine_image
    machine_image.attached? ? machine_image : 'no_image.jpg'
  end
end
