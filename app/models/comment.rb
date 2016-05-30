class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates_presence_of :text, :snippet, :user
end
