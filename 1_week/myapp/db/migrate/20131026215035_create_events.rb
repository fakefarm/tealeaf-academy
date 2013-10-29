class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :event_date
      t.string :title
      t.text :details

      t.timestamps
    end
  end
end
