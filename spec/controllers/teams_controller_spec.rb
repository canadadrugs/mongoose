require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TeamsController do

  def mock_team(stubs={})
    @mock_team ||= mock_model(Team, stubs)
  end

  describe "GET index" do
    it "assigns all teams as @teams" do
      Team.stub!(:find).with(:all).and_return([mock_team])
      get :index
      assigns[:teams].should == [mock_team]
    end
  end

  describe "GET show" do
    it "assigns the requested team as @team" do
      Team.stub!(:find).with("37").and_return(mock_team)
      get :show, :id => "37"
      assigns[:team].should equal(mock_team)
    end
  end

  describe "GET new" do
    it "assigns a new team as @team" do
      Team.stub!(:new).and_return(mock_team)
      get :new
      assigns[:team].should equal(mock_team)
    end
  end

  describe "GET edit" do
    it "assigns the requested team as @team" do
      Team.stub!(:find).with("37").and_return(mock_team)
      get :edit, :id => "37"
      assigns[:team].should equal(mock_team)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created team as @team" do
        Team.stub!(:new).with({'these' => 'params'}).and_return(mock_team(:save => true))
        post :create, :team => {:these => 'params'}
        assigns[:team].should equal(mock_team)
      end

      it "redirects to the created team" do
        Team.stub!(:new).and_return(mock_team(:save => true))
        post :create, :team => {}
        response.should redirect_to(team_url(mock_team))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved team as @team" do
        Team.stub!(:new).with({'these' => 'params'}).and_return(mock_team(:save => false))
        post :create, :team => {:these => 'params'}
        assigns[:team].should equal(mock_team)
      end

      it "re-renders the 'new' template" do
        Team.stub!(:new).and_return(mock_team(:save => false))
        post :create, :team => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested team" do
        Team.should_receive(:find).with("37").and_return(mock_team)
        mock_team.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :team => {:these => 'params'}
      end

      it "assigns the requested team as @team" do
        Team.stub!(:find).and_return(mock_team(:update_attributes => true))
        put :update, :id => "1"
        assigns[:team].should equal(mock_team)
      end

      it "redirects to the team" do
        Team.stub!(:find).and_return(mock_team(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(team_url(mock_team))
      end
    end

    describe "with invalid params" do
      it "updates the requested team" do
        Team.should_receive(:find).with("37").and_return(mock_team)
        mock_team.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :team => {:these => 'params'}
      end

      it "assigns the team as @team" do
        Team.stub!(:find).and_return(mock_team(:update_attributes => false))
        put :update, :id => "1"
        assigns[:team].should equal(mock_team)
      end

      it "re-renders the 'edit' template" do
        Team.stub!(:find).and_return(mock_team(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested team" do
      Team.should_receive(:find).with("37").and_return(mock_team)
      mock_team.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the teams list" do
      Team.stub!(:find).and_return(mock_team(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(teams_url)
    end
  end

end