# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:post_one)
    @user = users(:user_one)
    sign_in @user
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    title = Faker::Lorem.word
    body = Faker::Lorem.paragraph

    post posts_url, params: { post: { body: body, category_id: Category.first.id, title: title, creator_id: User.first.id } }

    post = Post.find_by!(body: body, title: title)
    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
