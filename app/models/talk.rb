class Talk < ApplicationRecord
    validates :content, {presence: true}
    belongs_to :entry
    belongs_to :user
end
