class Post < ApplicationRecord
  belongs_to: contributor, polymorphic: true
end
