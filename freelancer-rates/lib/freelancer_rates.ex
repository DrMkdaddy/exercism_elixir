defmodule FreelancerRates do
  @days_in_month 22
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount), do: before_discount * (1 - discount / 100)

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(@days_in_month)
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    |> then(fn daily_rate -> budget / daily_rate end)
    |> Float.floor(1)
  end
end
