require 'rails_helper'
#Each RSpec file typically requires the rails_helper.rb file.

describe "adding a new task" do
  fixtures :all

  it "can add and reorder a task" do
    visit project_path(projects(:bluebook))    #1st failure & 2nd failure
    #Navigating (string URL, Rails routing method)

    fill_in "Task", with: "Find UFOs"
    select "2", from: "Size"
    #Interaction-form (form label, element name or id)

    click_on "Add Task"   # 3rd failure
    #Interaction-link & button (text or element id)

    expect(current_path).to eq(project_path(projects(:bluebook)))

    within("#task_3") do  # 4th failure
      expect(page).to have_selector(".name", text: "Find UFOs")
      expect(page).to have_selector(".size", text: "2")
      expect(page).not_to have_selector("a", text: "Down")
      click_on("Up")      # 5th failure
    end

    expect(current_path).to eq(project_path(projects(:bluebook)))
    within("#task_2") do
      expect(page).to have_selector(".name", text: "Find UFOs")
    end
    #Querying(within, current_url/current_path)

  end
end
