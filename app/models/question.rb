class Question < ApplicationRecord
  belongs_to :deck

  validates_presence_of :content, :solution

  #validates_uniqueness_of :content
end
