class User < ActiveRecord::Base
  has_many :recipes
  has_many :relationships
  has_many :families, through: :relationships, class_name: "User"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
