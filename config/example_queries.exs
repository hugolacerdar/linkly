import Ecto.Query
alias Ecto.Adapters.SQL
alias Linkly.Repo
alias Linkly.{Bookmark, Link, LinkTag, Tag, User}

links_to_insert = [
  [
    url: "https://alchemist.camp",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    url: "https://reactor.am",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    url: "https://indiehackers.com",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ]
]

users_to_insert = [
  [
    username: "lia",
    email: "lia@example.com",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    username: "hugo",
    email: "hugo@example.com",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    username: "alchs",
    email: "alchs@camps.com",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ]
]

bookmarks_to_insert = [
  [
    title: "A site with lots of Elixir tutorials",
    user_id: 1,
    link_id: 1,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "Alchemist Camp",
    user_id: 2,
    link_id: 1,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "Reactor Podcast",
    user_id: 2,
    link_id: 2,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "IH",
    user_id: 1,
    link_id: 3,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ]
]

tags_to_insert = [
  [
    title: "Business",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "Community",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "Elixir",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "Podcast",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "Projects",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    title: "Resource",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ]
]

link_tags_to_insert = [
  [
    link_id: 1,
    user_id: 1,
    tag_id: 3,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    link_id: 2,
    user_id: 2,
    tag_id: 1,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    link_id: 2,
    user_id: 2,
    tag_id: 4,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    link_id: 1,
    user_id: 3,
    tag_id: 5,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ],
  [
    link_id: 2,
    user_id: 3,
    tag_id: 5,
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  ]
]

Repo.insert_all("users", users_to_insert, returning: [:id, :username])
Repo.insert_all("links", links_to_insert, returning: [:id, :url])
Repo.insert_all("bookmarks", bookmarks_to_insert)
Repo.insert_all("tags", tags_to_insert)
Repo.insert_all("link_tags", link_tags_to_insert)

Repo.query("select * from users")

get_user2 = from(u in "users", where: u.id == 2, select: u.username)
get_hugo = from(u in "users", where: u.username == "hugo", select: u.id)
get_hugo_alt = from("users", where: [username: "hugo"], select: [:id])

Repo.one(get_user2)
Ecto.Adapters.SQL.explain(Linkly.Repo, :all, get_hugo) |> IO.puts()
Repo.one(get_hugo)
Repo.one(get_hugo_alt)

get_bookmarks = from("bookmarks", select: [:user_id, :link_id, :title])
Repo.all(get_bookmarks)

get_lia_bookmarks =
  from(b in "bookmarks",
    where: b.user_id == 1,
    select: [:user_id, :link_id, :title]
  )

Repo.all(get_lia_bookmarks)

get_lia_bookmarks2 =
  from(u in "users",
    where: u.username == "lia",
    join: b in "bookmarks",
    on: b.user_id == u.id,
    join: l in "links",
    on: b.link_id == l.id,
    select: [u.username, l.url, b.title]
  )

Repo.all(get_lia_bookmarks2)

# Use the username to trigger updates
name = "hugo"
# pin obrigatório para tornar a variável definida
by_name = from(u in "users", where: u.username == ^name)
{1, _} = Repo.update_all(by_name, set: [email: "hugolacr@example.com"])

# Assim como para deletar
# {1, _} = Repo.delete_all post

kira_user = %User{
  username: "kira",
  email: "kira@bark.com",
  about:
    "I like to bark. au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! au! "
}

Repo.insert(kira_user)

# kira_query = from(User, where: [username: "kira"])
# Repo.update_all(kira_query, set: [email: "kira@auau.com"])

query = from(b in Bookmark, where: b.link_id == 2)
Repo.aggregate(query, :count, :id)

lia = Repo.get_by(User, [username: "lia"])

new_bm = Ecto.build_assoc(
  sam,
  :bookmarks,
  title: "Lots of tech books"
)

Repo.get_by(User, [username: "lia"])
|> Ecto.build_assoc(:bookmarks, title: "Lots of tech books")
|> change()
|> put_assoc(:link, [url: "https://manning.com"])
|> Repo.insert()

%{
  "title" => "Lots of tech books",
  "link" => %{
    %{"url" => "https://manning.com"}
  },
  %{"user_id" => "4"}
}

%Bookmark{}
|> Bookmark.changeset(attrs)
|> cast_assoc(:link)
|> Repo.insert()
