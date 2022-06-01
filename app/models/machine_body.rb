class MachineBody < ApplicationRecord
  belongs_to :body_part
  belongs_to :machine
end
