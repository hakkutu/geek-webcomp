class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :cds,through: :cd_favorites
has_many :artists,through: :artist_favorites
has_many :cds,through: :user_comments
has_one :cart
has_many :cds,through: :cart_cds
has_many :orderlists
has_many :user_comments
has_many :cd_favorites
attachment :image
end

