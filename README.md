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
https://viblo.asia/p/tim-
hieu-active-storage-trong-rails-L4x5xaaOKBM

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

* Create order
* rails generate migration enable_pgcrypto_extension





* ================== GIT AND GITHUB ================ *

** không viết code trên nhánh dev và master (chỉ viết code fix bug wr nhánh local tự tạo)
* Tạo nhánh dev local rồi pull code từ origin dev về để đồng bộ code ở dev local và origin dev
* Trước khi push lên nhánh dev phải add -> commit xong rồi pull code về rồi push
* Fix hay create 1 chức năng ở nhánh local tự tạo thì phải add commit -> push lên origin (nhánh local tự tạo) sau đó qua nhánh dev pull code origin dev xuống (để đồng bộ) -> qua nhánh local tự tạo rebase dev -> checkut lại dev rồi merge (trường hợp không checkut qua dev đc thì ở nhánh local merger vs dev luôn sau khi merge thì add rồi commit) -> checkout dev rồi merge lại ve test để có xung đột thì config ->  cuối cùng add . -> commit  -> push


* Create offer
rails g model Offer note:text amount:integer days:integer status:integer request:references user:references




* khi từ nhánh local rebase tới dev mà hiện lỗi --continue | --abort | --skip
* git rebase --abort là nhánh head sẽ nhảy qua dev local rồi sau đó reset về commit mới nhất của nhánh local

* rails g model Review review:text stars:integer order:references gig:references buyer:references seller:references


* Create app chat message

* rails g model Conversation sender:references receiver:references
* rails g model Message content:text user:references conversation:references

* Realtime message not reload page
* rails g channel Message
 