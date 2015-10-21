defmodule EctoBlog.Rating do
  use Ecto.Model

  after_insert :update_average_rating
  after_update :update_average_rating
  after_delete :update_average_rating

  schema "ratings" do
    belongs_to :post, EctoBlog.Post
    field :value, :integer

    timestamps
  end

  def update_average_rating changeset do
    post_id = get_field(changeset, :post_id)

    average_rating = EctoBlog.Repo.one(
      from r in EctoBlog.Rating,
        select: avg(r.value),
        where: r.post_id == ^post_id
    )

    EctoBlog.Repo.update_all(
      from(p in EctoBlog.Post, where: p.id == ^post_id),
      set: [average_rating: average_rating]
    )

    changeset
  end
end
