class MyShoe < ApplicationRecord
    validates :shoe_id, presence: true, on: :update
    
    
    
    
    belongs_to :user
    belongs_to :shoe
end
