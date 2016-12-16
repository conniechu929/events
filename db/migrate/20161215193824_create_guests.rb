class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
