class Area < ApplicationRecord
    #validates :user_id, allow_nil: true
     has_many :my_areas
end
