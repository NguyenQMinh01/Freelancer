ActiveAdmin.register Gig do
  # Strong parameters trong Rails
  # cho phép Rails controllers nhận giá trị truyền từ views
  # Cho các thuộc tính được khai báo dưới đây
  permit_params :title, :video, :active, :has_single_pricing, :user_id, :category_id

  index do
    selectable_column
    id_column
    column :title
    column :video 
    column :active
    column :has_single_pricing
    column :user_id
    column :category_id
    column :created_at
    column :update_at
    actions
  end

  # Cho phép admin search theo các thuộc tính này tại trang index
  filter :active
  filter :has_single_pricing

  # Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
  
  # form do |f|
  #   f.inputs "Gigs Details" do
  #     f.input :name
  #     f.input :image
  #     f.input :description
  #     f.input :price
  #     f.input :year
  #   end
  #   f.actions
  # end

end