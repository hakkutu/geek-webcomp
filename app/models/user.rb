class User < ApplicationRecord
  # Include default devie modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :cds,through: :cd_favorites
has_many :artist_favorites, dependent: :destroy
has_many :artists,through: :artist_favorites
has_many :cds,through: :user_comments
has_one :cart, dependent: :destroy
has_many :cds,through: :cart_cds
has_many :orderlists, dependent: :destroy
has_many :user_comments, dependent: :destroy
has_many :cd_favorites, dependent: :destroy
attachment :image

validates :email, :name, :kano_name,   presence: true

#userが新規登録する段階でそいつ用のcartができる
before_create :build_default_cart
private
def build_default_cart
  build_cart
  true
end

end
