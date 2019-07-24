class MyArea < ApplicationRecord
    validates :user_id, presence: true
    validates :area_id, presence: true
    
    
    belongs_to :user
    belongs_to :area
end
