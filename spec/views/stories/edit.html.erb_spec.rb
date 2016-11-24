require 'rails_helper'

RSpec.describe "stories/edit", type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :number => 1,
      :title => "MyString",
      :estimated_points => 1,
      :real_points => 1
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "input#story_number[name=?]", "story[number]"

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "input#story_estimated_points[name=?]", "story[estimated_points]"

      assert_select "input#story_real_points[name=?]", "story[real_points]"
    end
  end
end
