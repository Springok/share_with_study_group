#stub
test "here's a sample stub" do
  stubby = stub(name: "Paul", weight: 100)
  assert_equal("Paul", stubby.name)
end


#stubs
test "let's stub an object again" do
  project = Project.new(name: "Project Greenlight")
  project.stubs(:name).returns("Fred")
  assert_equal("Fred", project.name)
end

#expects
test "let's mock an object" do
  mock_project = Project.new(:name => "Project Greenlight")
  mock_project.expects(:name).returns("Fred")
  assert_equal("Fred", mock_project.name)
end
