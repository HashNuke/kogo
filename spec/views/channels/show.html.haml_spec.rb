require 'spec_helper'

describe "channels/show.html.haml" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel))
  end

  it "renders attributes in <p>" do
    render
  end
end
