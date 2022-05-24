class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  MALE = 0
  FEMALE = 1
  OTHER = 2

  enum gender: {
    Male: MALE,
    Female: FEMALE,
    Other: OTHER
  }

end
