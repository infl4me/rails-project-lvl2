require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'should create comment' do
    assert_difference('PostComment.count') do
      post post_comments_path(posts(:one)), params: { post_comment: { content: 'blablabla' } }
    end

    assert_redirected_to post_path(posts(:one))
  end
end
