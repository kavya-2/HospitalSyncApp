class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.text :medical_history
      t.datetime :last_synced_at

      t.timestamps
    end
  end
end
