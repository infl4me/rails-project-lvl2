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
    content = Faker::Lorem.paragraph

    post post_comments_path(@post), params: { post_comment: { content: content } }

    PostComment.find_by!(content: content)
    assert_redirected_to(/#{post_path(@post)}/)
  end

  test 'should create child comment' do
    content = Faker::Lorem.paragraph

    post post_comments_path(@post), params: { post_comment: { content: content, parent_id: @post_comment.id } }

    child_comment = PostComment.find_by!(content: content)
    assert { @post_comment == child_comment.parent }
    assert_redirected_to(/#{post_path(@post)}/)
  end
end
