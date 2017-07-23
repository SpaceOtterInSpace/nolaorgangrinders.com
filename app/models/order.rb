class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment

  def paid?
    amount_paid == amount
  end

  def amount_paid
    paid_for_this_order = user.paid - previous_order_cost

    if paid_for_this_order > self.amount
      return self.amount
    else
      return [0, paid_for_this_order].max
    end
  end

  def previous_orders
    orders = user.orders
    previous_orders = orders.select { |order| order.due_date < self.due_date }
  end

  def previous_order_cost
    previous_orders.map(&:amount).sum
  end

end
