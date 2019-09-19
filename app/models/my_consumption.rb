class MyConsumption < ApplicationRecord
    #validates :consumption_id, presence: true, on: :register#, on: :update
    #validates :user_id, uniqueness: true, on: :register
    
    belongs_to :user#, inverse_of: :user
    belongs_to :consumption
    
end
