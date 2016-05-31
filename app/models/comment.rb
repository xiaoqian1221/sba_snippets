class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates_presence_of :text, :snippet, :user

  after_create :comment_email_send

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def comment_email_send
    Resque.enqueue(MailSender, id)
  end
end
