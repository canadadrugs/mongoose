require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Team do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :active => false
    }
  end

  it "should create a new instance given valid attributes" do
    Team.create!(@valid_attributes)
  end
end
