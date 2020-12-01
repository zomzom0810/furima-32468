class Item < ApplicationRecord
    belongs_to :user
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :Prefecture
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :delivery_days
   
end
