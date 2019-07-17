class Entry < ApplicationRecord
    belongs_to :user
    belongs_to :chat
    has_many :talks, :dependent => :destroy
end
