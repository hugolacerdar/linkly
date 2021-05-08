defmodule Linkly.Tag do
  use Ecto.Schema
  alias Linkly.{Link, LinkTag, User}

  schema "tags" do
    field(:title)
    has_many(:taggings, LinkTag)
    many_to_many(:users, User, join_through: LinkTag)
    many_to_many(:links, Link, join_through: LinkTag)

    timestamps()
  end
end
