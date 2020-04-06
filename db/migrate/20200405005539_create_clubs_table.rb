class CreateClubsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :status, default: 0
      t.string :invitation_link

      t.timestamps
    end
  end
end
