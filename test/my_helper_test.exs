defmodule MyHelperTest do
  use ExUnit.Case
  doctest MyHelper

  test "greets the world" do
    assert MyHelper.hello() == :world
  end
end
