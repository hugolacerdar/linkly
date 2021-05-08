defmodule Linkly.LinkTag do
  use Ecto.Schema
  alias Linkly.{Link, Tag, User}

  schema "link_tags" do
    belongs_to(:link, Link)
    belongs_to(:tag, Tag)
    belongs_to(:user, User)

    timestamps()
  end
end
