class MyConsumption < ApplicationRecord
    validates :consumption_id, presence: true, on: :update 
    
    
    belongs_to :user
    belongs_to :consumption
    
end
