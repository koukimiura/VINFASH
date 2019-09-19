class Inquiry < ApplicationRecord
    
    validates :name, presence: true
    validates :email, presence: true#, uniqueness: true
    validates :content, presence: true
    
    
    
end
