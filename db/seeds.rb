# frozen_string_literal: true

%w[development business ruby js job].each do |category|
  Category.create(name: category)
end

if Rails.env.development?
  user = if User.count.zero?
           User.create(
             email: 'asd@asd',
             password: 'asd@asd',
             password_confirmation: 'asd@asd'
           )
         else
           User.first
         end

  5.times do
    user.posts.create(
      title: Faker::Lorem.word,
      body: Faker::Lorem.paragraph(sentence_count: 2),
      category_id: Category.first.id
    )
  end

  3.times do
    user.post_comments.create(
      content: Faker::Lorem.paragraph(sentence_count: 2),
      post: Post.first
    )
  end

  user.post_comments.create(
    content: Faker::Lorem.paragraph(sentence_count: 2),
    post: Post.first,
    parent: Post.first.comments.first
  )
end
