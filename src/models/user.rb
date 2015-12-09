class User < ActiveRecord::Base

  has_many :foodanswer

  validates :username,    presence: true, uniqueness: { message: "Username already exist." }, on: :create
  validates :email,       presence: true, uniqueness: { message: "Email already exist." }, on: :create
  validates :password,    presence: true, length:     { minimum: 4  }, on: :creeate
end
