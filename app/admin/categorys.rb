ActiveAdmin.register Category do
  # Strong parameters trong Rails
  # cho phép Rails controllers nhận giá trị truyền từ views
  # Cho các thuộc tính được khai báo dưới đây
  permit_params :name, :gigs, :requests, :create_at, :update_at

  index do
    selectable_column
    id_column
    column :name
    column :gigs
    column :requests
    column :create_at 
    column :update_at 
    actions
  end

  # Cho phép admin search theo các thuộc tính này tại trang index
  filter :requests
  filter :name

  # Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
  
  form do |f|
    f.inputs "Category Details" do
      f.input :gigs
      f.input :name
      f.input :requests
      f.input :create_at
      f.input :update_at
    end
    f.actions
  end

end