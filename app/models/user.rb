class User
  VALID_EMAILS = ["damien@dmathieu.com", "billard.pauline@gmail.com"]
  attr_accessor :email

  def initialize(email)
    @email = email
  end

  def admin?
    !guest? && VALID_EMAILS.include?(email)
  end

  def guest?
    email.nil?
  end
end
