# How to Run

* git clone git@github.com:notorious94/coding-test-by-leonika.git
* cp .env.sample .env
* rails db:create
* rails db:migrate
* rails db:seed

## Note 
Use the curl command to run the api endpoints

# API Endpoint

To create a passenger:  http://localhost:3000/api/v1/users/create

### Parameters
* name
* gender
* email


To get data of passenger on a specific day: http://localhost:3000/api/v1/users/per_day_passenger_count
### Parameters
* date
* gender
* page_no

To get data of passenger on a specific datetime:  http://localhost:3000/api/v1/users/passenger_count_on_time
### Parameters
* datetime
* gender
* page_no
