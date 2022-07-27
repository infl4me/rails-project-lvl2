# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
    @post = posts(:post_one)
  end

  test 'should not increment more than once from single user' do
    assert_difference('PostLike.count') do
      post post_likes_path(@post)
      post post_likes_path(@post)
    end

    assert_redirected_to post_path(@post)
  end

  test 'should not decrement more than once from single user' do
    post post_likes_path(@post)
    assert_difference('PostLike.count', -1) do
      like_id = PostLike.last.id
      delete post_like_path(@post, like_id)
      delete post_like_path(@post, like_id)
    end

    assert_redirected_to post_path(@post)
  end
end
