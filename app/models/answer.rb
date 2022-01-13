class Answer < ApplicationRecord
  belongs_to :posts

  with_options presence: true do
    validates :question
    validates :answer
  end
end
