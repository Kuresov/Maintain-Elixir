defmodule Maintain.RegistrationController do
	use Maintain.Web, :controller
	alias Maintain.User

	def new(conn, _params) do
		changeset = User.changeset(%User{})
    render(conn, changeset: changeset)
	end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Maintain.Registration.create(changeset, Registration.Repo) do
      {:ok, changeset} -> false # Sign the user in
      {:error, changeset} -> false # Show error
    end
  end
end
