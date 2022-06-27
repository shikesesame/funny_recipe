class Recipe < ApplicationRecord
    # 画像情報
    has_one_attached :image
    
    def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image
    end
    
    def favorited_by?(customer)
        favorites.exists?(customer_id: customer.id)
    end
    
    # アソシエーション
    belongs_to :customer
    has_many :recipe_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    #バリデーション
    validates :name, presence: true
    validates :material, presence: true, length: { maximum: 200 }
    validates :explanation, presence: true, length: { maximum: 200 }
end
