defmodule Linkly.User do
  #  defstruct [:about, :email, :username, :id, :inserted_at, :updated_at] ==> struct pura
  use Ecto.Schema
  alias Linkly.Bookmark

  schema "users" do
    # field :id, :id, primary_key: true
    field(:about)
    field(:email)
    field(:username)
    has_many(:bookmarks, Bookmark)

    timestamps()
  end
end
