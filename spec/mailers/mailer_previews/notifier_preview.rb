class NotifierPreview < ActionMailer::Preview
  def password_reset
    user = User.create(first_name: "Joe", last_name: "Bloggs", email: "joebloggs@email.com", password: "testpassword123", password_confirmation: "testpassword123")
    user.generate_password_reset_token!
    mailer = Notifier.password_reset(user)
    user.destroy
    mailer
  end
end

