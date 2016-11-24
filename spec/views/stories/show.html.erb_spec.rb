require 'rails_helper'

RSpec.describe "stories/show", type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :number => 2,
      :title => "Title",
      :estimated_points => 3,
      :real_points => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
