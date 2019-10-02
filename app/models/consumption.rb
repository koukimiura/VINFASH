class Consumption < ApplicationRecord
    #validates :price, {presence: true}
    #validates :user_id, allow_nil: true
    has_many :users, foreign_key: "consumption_id"
end
