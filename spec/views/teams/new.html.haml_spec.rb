require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teams/new.html.haml" do
  include TeamsHelper

  before(:each) do
    assigns[:team] = stub_model(Team,
      :new_record? => true,
      :name => "value for name",
      :active => false
    )
  end

  it "renders new team form" do
    render

    response.should have_tag("form[action=?][method=post]", teams_path) do
      with_tag("input#team_name[name=?]", "team[name]")
      with_tag("input#team_active[name=?]", "team[active]")
    end
  end
end
