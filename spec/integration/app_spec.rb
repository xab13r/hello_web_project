require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET to /' do
    it 'returns 200 OK with the right content' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Some response data')
    end
  end

  context 'GET /names' do
    it 'returns 200 with the right content' do
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end
  end

  context 'POST to /submit' do
    it 'returns 200 OK with the right content' do
      response = post('/submit', name: 'Dana', message: 'Hello World')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Thanks Dana, you sent this message: "Hello World"')
    end
  end

  context 'POST to /sort-names' do
    it 'returns 200 OK with the right content' do
      names = 'Joe,Alice,Zoe,Julia,Kieran'

      response = post('/sort-names', names: names)

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end
  
  context "GET to /hello" do
    it "contains a body" do
      response = get('/hello')
      expect(response.body).to include('<body>')
    end
    
    it "returns the correct body" do
      response = get('/hello', name: 'Lorenzo')
      
      expect(response.body).to eq("<html>\n  <head></head>\n  <body>\n    <h1>Hello! Lorenzo</h1>\n  </body>\n</html>")
    end
  end
end
