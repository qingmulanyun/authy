class AddCountryCodeToUser < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :country_code, :string
  end

  def self.down
    remove_column :users, :country_code
  end
end
