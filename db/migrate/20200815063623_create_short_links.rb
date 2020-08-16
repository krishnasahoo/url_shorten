class CreateShortLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :short_links do |t|
      t.string :key
      t.string :source_url
      t.datetime :expire_date

      t.timestamps
    end
  end
end
