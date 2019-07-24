class MyShoe < ApplicationRecord
    validates :shoe_id, presence: true
    
    belongs_to :user
    belongs_to :shoe
end
