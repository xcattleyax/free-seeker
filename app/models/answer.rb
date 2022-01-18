class Answer < ApplicationRecord
  belongs_to :post

  with_options presence: true do
    validates :question
    validates :answer
  end
end
