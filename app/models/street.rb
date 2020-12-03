class Street < ApplicationRecord
    belongs_to :buy
    has_one :buy
end
