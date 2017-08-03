class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :members
  has_many :groups, through: :members
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
