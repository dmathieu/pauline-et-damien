class User
  VALID_EMAILS = ["damien@dmathieu.com", "billard.pauline@gmail.com"]
  attr_accessor :email

  def initialize(email)
    @email = email
  end

  def admin?
    VALID_EMAILS.include?(email)
  end
end
