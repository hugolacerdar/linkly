defmodule Linkly.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  alias Linkly.{Link, LinkTag, Tag, User}

  schema "tags" do
    field(:title)
    has_many(:taggings, LinkTag)
    many_to_many(:users, User, join_through: LinkTag)
    many_to_many(:links, Link, join_through: LinkTag)

    timestamps()
  end

  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
