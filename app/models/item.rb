class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :categoly
    belongs_to :status
    belongs_to :Prefecture
    belongs_to :delivery_fee
    belongs_to :delivery_days

    belongs_to :user
end
