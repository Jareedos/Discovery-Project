class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :image
      t.string :channel
      t.datetime :pst_playtime
      t.datetime :est_playtime
      t.timestamps null: false
    end
  end
end