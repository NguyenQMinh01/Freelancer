class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # def facebook
    #     @user = User.from_omniauth(request.env["omniauth.auth"])

    #     if @user.persisted?
    #         sign_in_and_redirect @user, event: :authentication
    #         set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    #     else
    #         session["devise.facebook_data"] = request.env["omniauth.auth"]
    #         redirect_to new_user_registration_url
    #     end
    # end

    def failure
        redirect_to root_path
    end

    def google_oauth2
        user = User.from_omniauth(auth)

        if user.present?
            sign_out_all_scopes
            flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
            sign_in_and_redirect user, event: :authentication
        else
            flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
            redirect_to new_user_session_path
        end
    end

    private
  def auth
    @auth ||= request.env['omniauth.auth']
  end
end