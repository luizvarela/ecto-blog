defmodule EctoBlog.Post do
  use Ecto.Model

  schema "posts" do
    has_many :ratings, EctoBlog.Rating

    field :title
    field :content
    field :average_rating, :decimal

    timestamps
  end

  def highly_rated(query) do
    from p in query,
      left_join: r in assoc(p, :ratings),
      having: avg(r.value) > 4, group_by: p.id
  end

  def most_recent(query) do
    from p in query,
      order_by: [desc: p.inserted_at], limit: 5
  end

  def changeset(post, params \\ :empty) do
    post
    |> cast(params, ~w(title), ~w(content))
    |> validate_length(:title, min: 3)
  end
end
