defmodule FourElixir.ProblemTest do
  use FourElixir.ModelCase

  alias FourElixir.Problem

  @valid_attrs %{body: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Problem.changeset(%Problem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Problem.changeset(%Problem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
