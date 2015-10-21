EctoBlog
========

### Creating Posts
post = %EctoBlog.Post{title: "Hello", content: "Ecto"}
{:ok, inserted_post} = EctoBlog.Repo.insert(post)

### Find Posts by `title`
post = EctoBlog.Repo.get_by(EctoBlog.Post, title: "Hello")

### Find by Posts id
post = EctoBlog.Repo.get(EctoBlog.Post, 1)

### Updating Post
changed_post = %{ post | title: "Hello!!!!" }
{ :ok, updated_post } = EctoBlog.Repo.update(changed_post)

### Updating Post with changeset
post = EctoBlog.Repo.get_by(EctoBlog.Post, title: "Hello")
changeset = EctoBlog.Post.changeset(post, %{title: "Learn"})
{:ok, updated_post} = EctoBlog.Repo.update(changeset)

### Destroy Post
post = EctoBlog.Repo.get_by(EctoBlog.Post, title: "Hello")
EctoBlog.Repo.delete(post)

# Ecto Associations

### Listing
post = EctoBlog.Repo.get(EctoBlog.Post, 1) |> EctoBlog.Repo.preload(:ratings)
post.ratings

### Building
rating = EctoBlog.Model.build(post, :ratings, value: 5) |> EctoBlog.Repo.insert
