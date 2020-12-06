class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :delivery_day

    belongs_to :user
    has_one :buy
    has_one_attached :image

    with_options presence: true do
        validates :item_name,
                  length: { maximum: 40 }
        validates :explanation,
                   length: { maximum: 1000}
        validates :category_id
        validates :status_id
        validates :delivery_fee_id
        validates :prefecture_id
        validates :delivery_day_id
        validates :price,
                  format: {with: /\A[0-9]+\z/, message: '半角数字のみ使用可能'}, #半角数字のみ
                  numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} #300~9999999
        validates :image          
    end

    with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :status_id
        validates :delivery_fee_id
        validates :prefecture_id
        validates :delivery_day_id
    end
end

