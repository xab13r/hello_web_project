# Hello Web Project

Goal: Test-Driving Routes for a simple web application

##########


## GET /names Route Design Recipe

### 1. Design the Route Signature

- HTTP method: `GET`
- Path: `/names`
- Parameters: `names` (array)

```
# Request:
GET /names

# Expected response (2OO OK):
Julia, Mary, Karim
```

### 2. Design the Response

It returns a string with status 200 OK
```
Julia, Mary, Karim
```


### 3. Write Examples

```
# Request:

GET /names

# Expected response:

Julia, Mary, Karim
```

### 4. Encode as Tests Examples

```ruby
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 with the right content' do
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end
end
```