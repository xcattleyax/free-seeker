class Post < ApplicationRecord
  belongs_to :contributor, polymorphic: true
  has_many :pages
  has_many :comments

  validates :title, presence: true
end
