require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "index page should respond successfully with an HTTP 200 status code" do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "renders the register template" do
    get :register
    expect(response).to render_template("register")
  end

  it "register template should respond successfully" do
    get :register
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "renders the login template" do
    get :login
    expect(response).to render_template("login")
  end

  it "login page should respond successfully" do
    get :login
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

end
