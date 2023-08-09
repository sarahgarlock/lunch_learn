# Lunch 'n Learn

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Implement Basic Authentication
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).
<hr>

## Project Description

You are a back-end developer working on a team that is building an application to search for cuisines by country, and provide opportunity to learn more about that countries culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.
<hr>

## Setup

```
Fork and clone this repo
cd lunch_learn
`bundle install`
`rails db:{create,migrate,seed}`
`bundle exec rspec` to run tests
```
<hr>

## API Consumption

## [Air Quality API Key](https://api-ninjas.com/)

Endpoint - https://api.api-ninjas.com/v1/airquality?city=#{city}

### [Capital Search API Key](https://restcountries.com/#api-endpoints-v3-all)

Endpoint - https://restcountries.com/v3.1/name/#{country}

### [Country Search API Key](https://restcountries.com/#api-endpoints-v3-all)

Endpoint - https://restcountries.com/v3.1/all

### [Photo Search API Key](https://unsplash.com/documentation#creating-a-developer-account)

Endpoint - https://api.unsplash.com/search/photos?per_page=10&query=#{search}

### [Recipe Search API Key](https://developer.edamam.com/edamam-recipe-api)

Endpoint - https://api.edamam.com/api/recipes/v2?type=public&q=#{country}

### [Youtube Search API Key](https://developers.google.com/youtube/v3/getting-started)

Endpoint - https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=#{search}