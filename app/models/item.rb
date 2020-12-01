class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    validate :image_presence

    def image_presence  #画像がない時のバリデーション
        if image.attached?
            if !image.content_type.in?(%('image/jpeg image/png'))
             errors.add(:image, 'にはjpegまたはpngファイルを添付してください')   
        else
             errors.add(:image, 'ファイルを添付してください')
        end
    end
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :Prefecture
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :delivery_day

    with_options presence: true do
        validates :item_name
        validates :explanation
        validates :category_id
        validates :status_id
        validates :delivery_fee_id
        validates :prefecture_id
        validates :delivery_day_id
        validates :price
                  format{with: /\A[0-9]+\z/ }, #半角数字のみ保存可能
                  numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
    end

    with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :status_id
        validates :delivery_fee_id
        validates :prefecture_id
        validates :delivery_day_id
    end
end
