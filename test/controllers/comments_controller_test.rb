# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
    @post = posts(:post_one)
    @post_comment = post_comments(:post_comment_one)
  end

  test 'should create comment' do
    assert_difference('PostComment.count') do
      post post_comments_path(@post), params: { post_comment: { content: 'blablabla' } }
    end

    assert_redirected_to(/#{post_path(@post)}/)
  end

  test 'should create child comment' do
    assert_difference('PostComment.count') do
      post post_comments_path(@post), params: { post_comment: { content: 'blablabla', parent_id: @post_comment.id } }
    end

    assert_equal(@post_comment, PostComment.last.parent)

    assert_redirected_to(/#{post_path(@post)}/)
  end
end
