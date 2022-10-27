class ConfirmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.signup_confirm.subject
  #
  def signup_confirm(user)
    @user = user
    mail(to: @user.email, subject: "Welcome")
  end
end
