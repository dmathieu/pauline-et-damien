class User < ApplicationRecord
  VALID_EMAILS = ["damien@dmathieu.com", "billard.pauline@gmail.com"]

  def self.find_or_create(email)
    return User.new if email.blank?
    User.where(email: email).first || User.create(email: email)
  end

  def admin?
    !guest? && VALID_EMAILS.include?(email)
  end

  def guest?
    email.nil?
  end
end
