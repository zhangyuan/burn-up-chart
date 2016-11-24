require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        :number => 2,
        :title => "Title",
        :estimated_points => 3,
        :real_points => 4
      ),
      Story.create!(
        :number => 2,
        :title => "Title",
        :estimated_points => 3,
        :real_points => 4
      )
    ])
  end

  it "renders a list of stories" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
