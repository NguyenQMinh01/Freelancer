# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# CREATE GIG(hợp đồng thuê)
* dịch vụ và sẩn phẩm được tạo nên gọi là gig
* Create model

* create table category
rails g model Category name --no-test-framemwork #not create test category

rails g model Gig title video active:boolean has_signle_pricing:boolean user:references category:references --no-test-framemwork #not create test 

rails g model Pricing title description:text delivery_time:integer price:integer pricing_type:integer gig:references 

rails action_text:install

* Create controller
rails g controller Gigs new create edit update show 

* https://wikiki.github.io/components/steps/ 
* vô trang web để lấy code steps