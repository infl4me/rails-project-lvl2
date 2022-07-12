# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'should not increment the like more than once from single user' do
    assert_difference('PostLike.count') do
      post post_likes_path(posts(:one))
      post post_likes_path(posts(:one)) # should not increment twice
    end

    assert_redirected_to post_path(posts(:one))
  end

  test 'should not decrement the like more than once from single user' do
    post post_likes_path(posts(:one))
    assert_difference('PostLike.count', -1) do
      like_id = PostLike.last.id
      delete post_like_path(posts(:one), like_id)
      delete post_like_path(posts(:one), like_id)
    end

    assert_redirected_to post_path(posts(:one))
  end
end
