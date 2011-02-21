require 'spec_helper'

describe PagesController do
  integrate_views

  before(:each) do
    #
    # Define @base_title here.
    @base_title = 'Ruby on Rails Tutorial Sample App'
    #
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_tag("title", @base_title + " | Home")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_tag("title", @base_title + " | Contact")
    end
  end


  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_tag("title", @base_title + " | About")
    end
  end

  describe "GET 'help'" do
    it "shold be successful" do
      get 'help'
      response.should be_success
    end

    it "should have the right title" do
      get 'help'
      response.should have_tag("title", @base_title + " | Help")
    end
  end

  describe "for signed-in users" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    it "should show plural for 0 microposts" do
      get :home
      response.should have_tag("span.microposts", "0 microposts")
    end

    it "should show singular for 1 micropost" do
      1.times { Factory(:micropost, :user => @user, :content => "Foo bar") }
      get :home
      response.should have_tag("span.microposts", "1 micropost")
    end

    it "should show plural for many microposts" do
      5.times { Factory(:micropost, :user => @user, :content => "Foo bar") }
      get :home
      response.should have_tag("span.microposts", "5 microposts")
    end
  end


end

