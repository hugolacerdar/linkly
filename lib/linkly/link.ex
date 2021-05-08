defmodule Linkly.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.{Bookmark, Link, LinkTag, Tag, User}

  schema "links" do
    field(:url)
    has_many(:bookmarks, Bookmark)
    has_many(:taggings, LinkTag)
    many_to_many(:tags, Tag, join_through: LinkTag)
    many_to_many(:users, User, join_through: LinkTag)
    timestamps()
  end

  def changeset(%Link{} = link, attrs) do
    link
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> unique_constraint(:url)
  end
end
