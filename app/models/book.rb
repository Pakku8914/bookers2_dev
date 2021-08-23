class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :body, {length: {maximum: 200}}
  
  belongs_to :user
  
end
