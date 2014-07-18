class ChangeTimestamp < ActiveRecord::Migration
  def up
    drop_table :traceroutes
    create_table :traceroutes do |t|
      t.string :local_ip
      t.text :stdout
      t.text :stderr
      t.string :exit_status
      t.string :timestamp
      t.timestamps
    end
  end
  
  def down
  end
end
