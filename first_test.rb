require 'test_helper'

#first test
class TaskTest < ActiveSupport::TestCase
  test "a completed task is complete" do
    task = Task.new
    refute(task.complete?)
    task.mark_completed
    assert(task.complete?)
  end
end









#Controller test
test "should create article" do
  #ActiveSupport::Testing::Assertions
  assert_difference('Article.count') do
    post :create, article: {title: 'Hi', body: 'This is my first article.'}
  end
  assert_redirected_to article_path(assigns(:article))
  assert_equal 'Article was successfully created.', flash[:notice]
end
