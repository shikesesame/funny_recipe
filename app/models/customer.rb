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
  
end
