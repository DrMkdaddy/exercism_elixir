defmodule KitchenCalculator do
  @milliliters_per_cup 240
  @milliliter_per_floz 30
  @milliliter_per_teaspoon 5
  @milliliter_per_tablespoon 15
  def get_volume({_, v}), do: v

  def to_milliliter(v = {:milliliter, _}), do: v
  def to_milliliter({:cup, cups}), do: {:milliliter, cups * @milliliters_per_cup}

  def to_milliliter({:fluid_ounce, fluid_ounces}),
    do: {:milliliter, fluid_ounces * @milliliter_per_floz}

  def to_milliliter({:teaspoon, teaspoons}),
    do: {:milliliter, teaspoons * @milliliter_per_teaspoon}

  def to_milliliter({:tablespoon, tablespoons}),
    do: {:milliliter, tablespoons * @milliliter_per_tablespoon}

  def from_milliliter(v = {:milliliter, _}, :milliliter), do: v
  def from_milliliter({:milliliter, v}, :cup), do: {:cup, v / @milliliters_per_cup}

  def from_milliliter({:milliliter, v}, :fluid_ounce),
    do: {:fluid_ounce, v / @milliliter_per_floz}

  def from_milliliter({:milliliter, v}, :teaspoon),
    do: {:teaspoon, v / @milliliter_per_teaspoon}

  def from_milliliter({:milliliter, v}, :tablespoon),
    do: {:tablespoon, v / @milliliter_per_tablespoon}

  def convert(v = {unit, _}, unit), do: v
  def convert(volume_pair, unit), do: from_milliliter(to_milliliter(volume_pair), unit)
end
