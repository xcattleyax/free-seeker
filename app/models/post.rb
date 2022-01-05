class Post < ApplicationRecord
  belongs_to :contributor, polymorphic: true
  has_many :pages

  validates :title, presence: true
end
