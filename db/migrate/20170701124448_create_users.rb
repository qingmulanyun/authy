class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :image_url
      t.string :role
      t.string :status


      t.timestamps
      t.index :phone,  unique: true
      t.index :email,  unique: true
    end
  end
end
