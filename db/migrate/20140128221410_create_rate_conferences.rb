class CreateRateConferences < ActiveRecord::Migration
  def change
    create_table :rate_conferences do |t|
      t.references :conference
      t.references :attendee
      t.references :event
      t.integer :value

      t.timestamps
    end
    add_index :rate_conferences, :conference_id
    add_index :rate_conferences, :attendee_id
    add_index :rate_conferences, :event_id
  end
end
