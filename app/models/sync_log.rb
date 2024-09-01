class SyncLog < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :last_synced_at, presence: true
  validates :sync_status, presence: true
end
