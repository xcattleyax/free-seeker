class Page < ApplicationRecord
  belongs_to :post

  with_options presence: true do
    validates :content
    validates :text
    validates :page
  end
end
