class AddAuthyTokenToUser < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :authy_id, :string
  end

  def self.down
    remove_column :users, :authy_id
  end
end
