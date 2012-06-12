module ApplicationHelper

  def current_user
    resp = Faraday.get "http://localhost:4000/users/#{session[:user_token]}.json"
    user = Hashie::Mash.new(JSON.parse(resp.body))
  end
  
end
