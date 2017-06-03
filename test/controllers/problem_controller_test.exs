defmodule FourElixir.ProblemControllerTest do
  use FourElixir.ConnCase

  alias FourElixir.Problem
  @valid_attrs %{body: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, problem_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing problems"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, problem_path(conn, :new)
    assert html_response(conn, 200) =~ "New problem"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, problem_path(conn, :create), problem: @valid_attrs
    assert redirected_to(conn) == problem_path(conn, :index)
    assert Repo.get_by(Problem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, problem_path(conn, :create), problem: @invalid_attrs
    assert html_response(conn, 200) =~ "New problem"
  end

  test "shows chosen resource", %{conn: conn} do
    problem = Repo.insert! %Problem{}
    conn = get conn, problem_path(conn, :show, problem)
    assert html_response(conn, 200) =~ "Show problem"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, problem_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    problem = Repo.insert! %Problem{}
    conn = get conn, problem_path(conn, :edit, problem)
    assert html_response(conn, 200) =~ "Edit problem"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    problem = Repo.insert! %Problem{}
    conn = put conn, problem_path(conn, :update, problem), problem: @valid_attrs
    assert redirected_to(conn) == problem_path(conn, :show, problem)
    assert Repo.get_by(Problem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    problem = Repo.insert! %Problem{}
    conn = put conn, problem_path(conn, :update, problem), problem: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit problem"
  end

  test "deletes chosen resource", %{conn: conn} do
    problem = Repo.insert! %Problem{}
    conn = delete conn, problem_path(conn, :delete, problem)
    assert redirected_to(conn) == problem_path(conn, :index)
    refute Repo.get(Problem, problem.id)
  end
end
