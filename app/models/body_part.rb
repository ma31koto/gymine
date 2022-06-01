class BodyPart < ApplicationRecord
  has_many :machine_bodys, dependent: :destroy
  has_many :machines, through: :machine_bodys
  
  validates :name, presence: true, uniqueness: true
end
