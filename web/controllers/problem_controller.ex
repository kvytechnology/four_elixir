defmodule FourElixir.ProblemController do
  use FourElixir.Web, :controller

  alias FourElixir.Problem

  def index(conn, _params) do
    problems = Repo.all(Problem)
    render(conn, "index.html", problems: problems)
  end

  def new(conn, _params) do
    changeset = Problem.changeset(%Problem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"problem" => problem_params}) do
    changeset = Problem.changeset(%Problem{}, problem_params)

    case Repo.insert(changeset) do
      {:ok, _problem} ->
        conn
        |> put_flash(:info, "Problem created successfully.")
        |> redirect(to: problem_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    problem = Repo.get!(Problem, id)
    render(conn, "show.html", problem: problem)
  end

  def edit(conn, %{"id" => id}) do
    problem = Repo.get!(Problem, id)
    changeset = Problem.changeset(problem)
    render(conn, "edit.html", problem: problem, changeset: changeset)
  end

  def update(conn, %{"id" => id, "problem" => problem_params}) do
    problem = Repo.get!(Problem, id)
    changeset = Problem.changeset(problem, problem_params)

    case Repo.update(changeset) do
      {:ok, problem} ->
        conn
        |> put_flash(:info, "Problem updated successfully.")
        |> redirect(to: problem_path(conn, :show, problem))
      {:error, changeset} ->
        render(conn, "edit.html", problem: problem, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    problem = Repo.get!(Problem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(problem)

    conn
    |> put_flash(:info, "Problem deleted successfully.")
    |> redirect(to: problem_path(conn, :index))
  end
end
