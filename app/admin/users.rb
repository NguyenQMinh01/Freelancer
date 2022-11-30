ActiveAdmin.register User do
    # Strong parameters trong Rails
    # cho phép Rails controllers nhận giá trị truyền từ views
    # Cho các thuộc tính được khai báo dưới đây
    permit_params :email, :encrypted_password ,:create_at, :update_at
  
    index do
      selectable_column
      id_column
      column :email
      column :encrypted_password
      actions
    end
  
    # Cho phép admin search theo các thuộc tính này tại trang index
    filter :email
  
    # Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
    
    form do |f|
      f.inputs "Category Details" do
        f.input :email
        f.input :encrypted_password
      end
      f.actions
    end
  
  end