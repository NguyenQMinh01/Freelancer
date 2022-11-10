# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  # menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") } 
 
  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
      section "DASHBOARD"

        section " Users" do
          table do
              User.count()
          end
        end
    
        section "Order" do
          table do
              Order.count()
          end
        end
    
        section "Category" do
          table do
              Category.count()
          end
        end
    
    
        section "Gig" do
          table do
              Order.count()
          end
        end
        
      end
    end

    

    
   

    
     
   

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
   end # content
   

  #  controller do
  #   def index
  #     @user_count = User.count()
  #   end
  # end
end
