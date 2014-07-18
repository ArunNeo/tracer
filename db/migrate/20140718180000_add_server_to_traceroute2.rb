class AddServerToTraceroute < ActiveRecord::Migration
  def change
    add_column :traceroutes, :server, :string
  end
end