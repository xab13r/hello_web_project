# Hello Web Project

Goal: Test-Driving Routes for a simple web application

## GET /names Route Design Recipe

### 1. Design the Route Signature

- HTTP method: `GET`
- Path: `/names`

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

## POST /sort-names Route Design Recipe

### 1. Design the Route Signature

- HTTP method: `POST`
- Path: `/sort-names`
- Parameters: `names` (comma-separated string)

### 2. Design the Response

It returns the names sorted alphabetically
```
Alice,Joe,Julia,Kieran,Zoe
```


### 3. Write Examples

```
# Request:
POST /sort-names

# Parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe
```

### 4. Encode as Tests Examples

```ruby
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /sort-names" do
    it 'returns 200 with the right content' do
      names = "Joe,Alice,Zoe,Julia,Kieran"
      
      response = post("/sort-names", names: names)
      
      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end
```