class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :login
      t.database_authenticatable :null => false
      t.timestamps
    end

    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table :users
  end
end
