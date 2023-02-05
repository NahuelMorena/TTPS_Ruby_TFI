class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, :surname, :role_id, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  
  belongs_to :role
  has_many :appointments
  enum role: [:admin, :personal, :client]

  #Method Class

  def self.get_user_by_branch_office(branch_office)
    User.where(branch_office_id: branch_office.id)
  end

  #Method Instance


end
