class Comment < ApplicationRecord

  belongs_to :post
  belongs_to :user

  with_options presence: true do
    validates :comment
    validates :status_id
  end
end
