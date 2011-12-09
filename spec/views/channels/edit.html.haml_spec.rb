require 'spec_helper'

describe "channels/edit.html.haml" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel))
  end

  it "renders the edit channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => channels_path(@channel), :method => "post" do
    end
  end
end
