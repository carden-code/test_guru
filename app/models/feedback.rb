class Feedback
  include ActiveModel::Model

  attr_accessor :email, :text

  validates :email, :text, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
