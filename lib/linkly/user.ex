defmodule Linkly.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.{Bookmark, Link, LinkTag, Tag, User}

  schema "users" do
    # field :id, :id, primary_key: true
    field(:about)
    field(:birth_date, :date, virtual: true)
    field(:email)
    field(:username)
    has_many(:bookmarks, Bookmark)
    has_many(:bookmarked_links, through: [:bookmarks, :link])
    has_many(:taggings, LinkTag)
    many_to_many(:tagged_links, Link, join_through: LinkTag)
    many_to_many(:tags, Tag, join_through: LinkTag)

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :about, :email, :birth_date])
    |> validate_required([:username, :email, :birth_date])
    |> validate_length(:username, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_change(:birth_date, &older_than_13/2)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

  defp older_than_13(:birth_date, %Date{} = birth_date) do
    {year, month, date} = Date.to_erl(Date.utc_today())
    min_date = Date.from_erl!({year - 13, month, date})

    case(Date.compare(min_date, birth_date)) do
      :lt -> [birth_date: "Must be over 13 years old!"]
      _ -> []
    end
  end
end
