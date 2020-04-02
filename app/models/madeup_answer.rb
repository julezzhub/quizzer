class MadeupAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :round

  validates :content, presence: true, allow_blank: false
end
