# Preview all emails at http://localhost:3000/rails/mailers/confirm_mailer
class ConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirm_mailer/signup_confirm
  def signup_confirm
    ConfirmMailer.signup_confirm
  end

end
