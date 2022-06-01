class CreateMachineTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :machine_types do |t|
      t.integer :post_id
      t.integer :machine_id
      t.timestamps
    end
  end
end
