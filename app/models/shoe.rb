class Shoe < ApplicationRecord
    has_many :users, foreign_key: "shoe_id"
end
