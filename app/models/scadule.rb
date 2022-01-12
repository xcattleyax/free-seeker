class Scadule < ApplicationRecord

  belongs_to :group

  with_options presence: true do
    validates :date
    validates :content
    validates :text
  end

end
