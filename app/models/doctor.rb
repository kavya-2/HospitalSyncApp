class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :sync_logs
  has_many :patients, through: :sync_logs

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
end
