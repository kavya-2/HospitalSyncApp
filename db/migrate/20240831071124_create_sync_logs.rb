class CreateSyncLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :sync_logs do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :last_sync_time
      t.integer :updated_by_doctor_id
      t.string :sync_status

      t.timestamps
    end
  end
end
