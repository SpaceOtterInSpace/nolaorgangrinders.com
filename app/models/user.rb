class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest
  has_many :orders
  has_many :payments
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }
  scope :active, -> { where(active: true) }

  def due_now
    total = orders.inject(0){ |sum, order|
      if order.due_date < 20.days.from_now
        sum + order.amount
      else
        sum
      end
    }
    total - paid < 0 ? 0 : total - paid
  end

  def paid_up?
    return due_now == 0
  end

  def total_due
    total = orders.inject(0){ |sum, order|
      sum + order.amount
    }
    total - paid
  end

  def paid
    payments.map(&:amount).sum
  end

  def format_paid
    if (paid.nil?)
      0
    else
      "$" + (paid/100).to_s
    end
  end

  def format_due
    if (due_now.nil?)
      0
    else
      "$" + (due_now/100).to_s
    end
  end

  def self.money_collected
    all.inject(0){|sum, user| sum + user.paid}
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attributes!(reset_digest:  reset_token, reset_sent_at: Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = activation_token
  end
end
