class Chat < ApplicationRecord
    has_many :entries, :dependent => :destroy
    accepts_nested_attributes_for :entries
    has_many :notifications, :dependent => :destroy
end
