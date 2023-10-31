class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :event_location
      t.datetime :event_time
      t.string :event_title

      t.timestamps
    end
  end
end
