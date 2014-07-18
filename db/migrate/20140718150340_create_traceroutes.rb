class CreateTraceroutes < ActiveRecord::Migration
  def change
    create_table :traceroutes do |t|
      t.string :local_ip
      t.text :stdout
      t.text :stderr
      t.text :exit_status
      t.time :timestamp

      t.timestamps
    end
  end
end
