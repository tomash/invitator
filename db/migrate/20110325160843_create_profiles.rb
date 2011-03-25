class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :fullname
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      
      # for paperclip
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
