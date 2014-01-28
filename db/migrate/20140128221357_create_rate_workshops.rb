class CreateRateWorkshops < ActiveRecord::Migration
  def change
    create_table :rate_workshops do |t|
      t.references :workshop
      t.references :attendee
      t.references :event
      t.integer :value

      t.timestamps
    end
    add_index :rate_workshops, :workshop_id
    add_index :rate_workshops, :attendee_id
    add_index :rate_workshops, :event_id
  end
end
