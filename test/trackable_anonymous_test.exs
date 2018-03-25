defmodule TrackableAnonymousTest do
  use ExUnit.Case
  doctest TrackableAnonymous

  test "greets the world" do
    assert TrackableAnonymous.hello() == :world
  end
end
