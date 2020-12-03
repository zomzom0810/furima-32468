class Buy < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :prefecture
    
   belongs_to :user
   belongs_to :item
   has_one :street
end
