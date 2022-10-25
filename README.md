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
* Tích hợp và sử dụng Active Storage
* Hiểu nôm na là để up load file , thư mục , image.....
https://viblo.asia/p/tim-hieu-active-storage-trong-rails-L4x5xaaOKBM

# CREATE GIG(hợp đồng thuê)
* tạo active text để handle viết description cho 1 bài post
* link tham khảo: https://viblo.asia/p/action-text-trong-rails-6-Qpmlex8MZrd
 
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

* yarn add dropzone (để upload image)

* yarn add bulma-extensions

