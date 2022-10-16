class RegistrationsController < Devise::RegistrationsController
    protected
    def update_resource(resource, params)
        respond.update_without_password(params)
    end

end