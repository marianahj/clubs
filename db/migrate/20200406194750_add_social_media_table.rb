class AddSocialMediaTable < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media do |t|
      t.string :name
      t.string :url
      t.integer :club_id

      t.timestamps
    end
  end
end
