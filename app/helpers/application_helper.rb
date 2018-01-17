module ApplicationHelper
  def format_money amount
    money = Money.from_amount amount.to_f, :usd
    money.format
  end
end
