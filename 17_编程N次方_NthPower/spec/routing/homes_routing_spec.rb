require 'rspec'
require 'rails_helper'

describe 'routes to homes', :type=>:routing do

  it 'routes to index' do
    expect(:get=>'homes/index').to route_to(:controller => 'homes',:action => 'index')
  end

  it 'routes to register' do
    expect(:get=>'homes/register').to route_to(:controller => 'homes',:action => 'register')
  end

  it 'routes to login' do
    expect(:get=>'homes/login').to route_to(:controller => 'homes',:action => 'login')
  end

  it 'routes to qrcode' do
    expect(:get=>'homes/qrcode').to route_to(:controller => 'homes',:action => 'qrcode')
  end

  it 'routes to evaluate' do
    expect(:get=>'homes/evaluate').to route_to(:controller => 'homes',:action => 'evaluate')
  end


end
