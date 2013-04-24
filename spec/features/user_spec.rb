require 'spec_helper'

describe "MVP tests." do
  fixtures :users
  fixtures :statuses

  it "Should be able to create a new account (with password)." do
    post_via_redirect user_registration_path, :user => {:name => "Newman", :email => 'newman@example.com', :password => 'changeme', :password_confirmation => 'changeme'}
    response.status.should be(200)
  end

  it "Should be able to log in." do
    post_via_redirect user_session_path, :user => {:email => "silver@example.com", :password => "changeme"}
    get statuses_path
    response.status.should be(200)
  end

  it "Should not see statuses without signing in" do
    get statuses_path
    response.status.should be(302) # redirect to sign in page
  end

  it "When logged in, should be able to see everyone else's status." do
    post_via_redirect user_session_path, 'user[email]' => "silver@example.com", 'user[password]' => "changeme"
    response.body.should include("In a meeting")
    response.body.should include("Out to lunch")
  end

  it "When logged in, should be able to set your own status." do
    post_via_redirect user_session_path, 'user[email]' => "silver@example.com", 'user[password]' => "changeme"
    post_via_redirect statuses_path, :status => {:entry => "This is just a test!"}
    response.status.should be(200) 
    response.body.should include("This is just a test!")
  end
end
