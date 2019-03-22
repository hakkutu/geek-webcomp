class User < ApplicationRecord
  # Include default devie modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
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

validates :email, :name, :kano_name, :address,:phone_number,  presence: true
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
validates :postcode,format:{with:/\A\d{7}\z/, message: 'ハイフンなしで7桁で入力してください。'}
validates :phone_number, presence: true,format:{with:/\A\d{10}$|\A\d{11}\z:/, message: 'は電話番号10桁(携帯番号の場合11桁)で入力してください。'}
validates :kano_name, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
#userが新規登録する段階でそいつ用のcartができる
before_create :build_default_cart
private
def build_default_cart
  build_cart
  true
end

end
