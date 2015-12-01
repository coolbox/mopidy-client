class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Rememberable
      t.datetime :remember_created_at

      ## Onmiauth
      t.string :provider
      t.string :uid

      ## Meta
      t.string :email,              null: false, default: ""
      t.string :image
      t.string :first_name
      t.string :last_name
      
      t.timestamps
    end

    add_index :users, [:provider, :uid]
    add_index :users, :email, unique: true
  end
end
