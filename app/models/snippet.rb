class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  has_many :comments

  validates_presence_of :user, :language, :title, :code
end
