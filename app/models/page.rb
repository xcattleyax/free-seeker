class Page < ApplicationRecord
  belongs_to :post

  validates :content, presence: true
  validates :text, presence: true
end
