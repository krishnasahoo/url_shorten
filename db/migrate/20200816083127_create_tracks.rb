class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.references :short_link, foreign_key: true
      t.string :referer
      t.string :ip_address
      t.integer :clicks
      t.datetime :clicked_at
      t.string :country_code
      t.string :user_agent

      t.timestamps
    end
  end
end
