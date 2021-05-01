defmodule Linkly.Bookmark do
  use Ecto.Schema

  schema "bookmarks" do
    field(:title)
    field(:link_id, :id)
    field(:user_id, :id)

    timestamps()
  end
end
