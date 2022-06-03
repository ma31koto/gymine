class Machine < ApplicationRecord
  has_many :machine_types, dependent: :destroy
  has_many :posts, through: :machine_types
  has_many :machine_bodys, dependent: :destroy
  has_many :body_parts, through: :machine_bodys

  validates :name, presence: true, uniqueness: true

  has_one_attached :machine_image
  attr_accessor :body_part_ids

  def get_machine_image
    machine_image.attached? ? machine_image : 'no_image.jpg'
  end
end
