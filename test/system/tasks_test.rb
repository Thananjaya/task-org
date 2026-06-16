require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase

  setup do
    @task = tasks(:first)
  end

  test "Creating a new task" do
    visit tasks_path
    assert_selector "h1", text: 'My Tasks'

    click_on "+ Task"
    fill_in "Name", with: @task.name
    click_on "Add this task!!"

    assert_selector "h1", text: "My Tasks"
    assert_text @task.name
  end

  test "Showing a task" do
    visit tasks_path
    click_on @task.name

    assert_selector "h2", text: @task.name 
  end

  test "Updating a task" do
    visit tasks_path
    assert_selector "h1", text: "My Tasks"

    click_on "Edit", match: :first
    assert_selector "h2", text: "Edit Task"

    fill_in "Name", with: "Updated task name"
    click_on "Update this task!!"
    
    assert_selector "h1", text: "My Tasks"
    assert_text "Updated task name"
  end

  test "Destroying a task" do
    visit tasks_path
    assert_selector "h1", text: "My Tasks"

    click_on "Delete", match: :first
    assert_no_text @task.name
  end
end
