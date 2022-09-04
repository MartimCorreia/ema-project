class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :patients, dependent: :destroy
         has_many :procedures, dependent: :destroy
         has_many :treatments, through: :patients, dependent: :destroy
         has_one_attached :photo
end
