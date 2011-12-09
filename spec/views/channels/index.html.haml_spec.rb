require 'spec_helper'

describe "channels/index.html.haml" do
  before(:each) do
    assign(:channels, [
      stub_model(Channel),
      stub_model(Channel)
    ])
  end

  it "renders a list of channels" do
    render
  end
end
