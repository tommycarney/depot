require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase

  setup do
    @cart = carts(:one)
    @cart.add_product(products(:ruby))
    @order = orders(:one)
    @order.add_line_items_from_cart(@cart)
  end

  test "received" do

    mail = OrderMailer.received(@order)
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.org"], mail.from
    assert_match /My String/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(@order)
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.org"], mail.from
    assert_match /MyString/, mail.body.encoded
  end
end
