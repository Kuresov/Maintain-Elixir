defmodule Maintain.RegistrationController do
	use Maintain.Web, :controller
	alias Maintain.User

	def new(conn, _params) do
		changeset = User.changeset(%User{})
    render(conn, changeset: changeset)
	end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Maintain.User.create(changeset, Maintain.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Account created")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Error creating account")
        |> render(registration_path(conn, :new))
    end
  end
end
