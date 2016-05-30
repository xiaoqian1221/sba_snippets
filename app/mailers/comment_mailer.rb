class CommentMailer < ApplicationMailer

  def comment_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Comment Added')
  end
end
