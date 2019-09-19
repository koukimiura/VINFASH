class MyShoe < ApplicationRecord
    #validates :shoe_id, presence: true
    #validates :user_id, uniqueness: true#, on: :update
    
    belongs_to :user#, inverse_of: :user
    belongs_to :shoe
end
