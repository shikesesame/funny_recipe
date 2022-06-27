class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # 画像情報      
  has_one_attached :image
  
  def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image
  end
 
  # アソシエーション 
  has_many :recipes, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  #バリデーション
  validates :name, uniqueness: true, length: { maximum: 20, minimum: 2 }
  validates :body, length: { maximum: 50 }
  
end
