class Post < ApplicationRecord
  belongs_to :contributor, polymorphic: true
  has_many :pages
  has_many :comments
  has_many :answers

  validates :title, presence: true
end
