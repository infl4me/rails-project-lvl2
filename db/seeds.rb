%w[development business ruby js job].each do |category|
  Category.create(name: category)
end

if Rails.env.development?
  user = if User.count.zero?
           User.create(
             email: 'john@doe.com',
             password: 'encrypted_password',
             password_confirmation: 'encrypted_password'
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
end
