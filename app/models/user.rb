class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :email, inclusion: { in: ["@"] }
  validates :nickname, presence: true
  # # パスワードが確認用一致しているか検証
  # validates :encrypted_password, confirmation: true
  # validates :encrypted_password_confirmation
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_detail, presence: true
  validates :first_name_detail, presence: true
  validates :birth_day, presence: true


end
