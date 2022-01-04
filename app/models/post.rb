class Post < ApplicationRecord
  belongs_to :contributor, polymorphic: true
  has_many :page

  validates :title, presence: true
end
