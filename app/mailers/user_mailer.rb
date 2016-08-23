class UserMailer < ApplicationMailer
  default :from => "cjvirtucio@personal.ly"

  def warn(user)
    @user = user
    mail(to: @user.email, subject: 'Changes in your registration')
  end

end
