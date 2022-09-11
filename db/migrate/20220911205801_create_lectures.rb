class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :attendee
      t.datetime :start_time
      t.datetime :end_time
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
