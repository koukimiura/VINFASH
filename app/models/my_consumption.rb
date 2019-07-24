class MyConsumption < ApplicationRecord
    #validates :consumption_id, presence: true
    
    belongs_to :user
    belongs_to :consumption
    
end
