class CreateMachineBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :machine_bodies do |t|
      t.integer :machine_id
      t.integer :body_part_id
      t.timestamps
    end
  end
end
