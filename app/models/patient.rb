class Patient < ApplicationRecord
	has_many :sync_logs
  has_many :doctors, through: :sync_logs

  validates :name, presence: true
  validates :medical_history, presence: true
end
