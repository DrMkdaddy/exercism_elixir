defmodule FreelancerRates do
  @days_in_month 22
  @hourly_rate 8.0
  def daily_rate(hourly_rate), do: hourly_rate * @hourly_rate

  def apply_discount(before_discount, discount), do: before_discount * (1 - discount / 100)

  def monthly_rate(hourly_rate, discount),
    do:
      hourly_rate
      |> daily_rate()
      |> then(fn daily_rate -> daily_rate * @days_in_month end)
      |> apply_discount(discount)
      |> Float.ceil()
      |> trunc()

  def days_in_budget(budget, hourly_rate, discount),
    do:
      daily_rate(hourly_rate)
      |> apply_discount(discount)
      |> then(fn daily_adjusted_rate -> Float.floor(budget / daily_adjusted_rate, 1) end)
end
