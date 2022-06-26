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
    
    # アソシエーション
    belongs_to :customer
    
    #バリデーション
    validates :name, presence: true
    validates :material, presence: true, length: { maximum: 200 }
    validates :explanation, presence: true, length: { maximum: 200 }
end
