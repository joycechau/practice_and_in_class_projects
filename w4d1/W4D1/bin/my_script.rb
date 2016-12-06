require 'addressable/uri'
require 'rest-client'
require 'byebug'

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.json'
    ).to_s

    puts RestClient.get(url)
end

# index_users

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
  new_user = RestClient.post(
    # {accept: :json},
    url,
    { user: { name: name, email: email } }
  ).json
  rescue RestClient::ExceptionWithResponse => e
    puts e.message
  end
end

create_user("Joyce", nil)
