# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user_one)
    sign_in @user
    @post = posts(:post_one)
  end

  test 'should not increment more than once from single user' do
    post post_likes_path(@post)
    post post_likes_path(@post)

    assert { PostLike.where(post: @post, user: @user).size == 1 }

    assert_redirected_to post_path(@post)
  end

  test 'should not decrement more than once from single user' do
    post_two_like = post_likes(:post_two_like)
    post_two = posts(:post_two)

    delete post_like_path(post_two, post_two_like)
    delete post_like_path(post_two, post_two_like)

    assert { PostLike.where(post: post_two, user: @user).size.zero? }

    assert_redirected_to post_path(post_two)
  end
end
