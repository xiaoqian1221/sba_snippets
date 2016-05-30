class MailSender
  @queue = :emails_queue
  def self.perform(comment_id)
    comment = Comment.find(comment_id)
    CommentMailer.comment_mail(comment.snippet.user).deliver_now!
  end
end
