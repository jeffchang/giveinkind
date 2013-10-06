class CustomFailure < Devise::FailureApp
  def redirect_url
    if warden_options[:scope] == :user
      new_user_registration_path
    else
      new_user_registration_path
    end
  end
  def respond
    if http_auth?
      http_auth
    else
      store_location!
      flash[:alert] = i18n_message unless flash[:notice]
      redirect_to root_path
    end
  end
end