require 'spec_helper'

describe "channels/new.html.haml" do
  before(:each) do
    assign(:channel, stub_model(Channel).as_new_record)
  end

  it "renders new channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => channels_path, :method => "post" do
    end
  end
end
