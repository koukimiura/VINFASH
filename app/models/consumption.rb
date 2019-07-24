class Consumption < ApplicationRecord
    #validates :price, {presence: true}
    #validates :user_id, allow_nil: true
    has_many :my_consumptions
end
