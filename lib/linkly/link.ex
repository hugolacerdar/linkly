defmodule Linkly.Link do
  use Ecto.Schema
  alias Linkly.Bookmark

  schema "links" do
    field(:url)
    has_many(:bookmarks, Bookmark)

    timestamps()
  end
end
