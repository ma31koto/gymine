class Machine < ApplicationRecord
  has_many :machine_types, dependent: :destroy
  has_many :posts, through: :machine_types
  has_many :machine_bodys, dependent: :destroy
  has_many :body_parts, through: :machine_bodys

  validates :name, presence: true, uniqueness: true
  attr_accessor :body_part_ids

  has_one_attached :machine_image

  def get_pmachine_image
    machine_image.attached? ? machine_image : 'no_image.jpg'
  end
end
