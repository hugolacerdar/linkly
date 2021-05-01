defmodule Linkly.User do
  #  defstruct [:about, :email, :username, :id, :inserted_at, :updated_at] ==> struct pura
  use Ecto.Schema

  schema "users" do
    # field :id, :id, primary_key: true
    field(:about)
    field(:email)
    field(:username)

    timestamps()
  end
end
