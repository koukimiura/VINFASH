class Friend < ApplicationRecord
    validates :follower, {presence: true}
    validates :followed, {presence: true}
end
