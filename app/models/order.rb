class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment

  def paid?
    !payment.nil?
  end
end
