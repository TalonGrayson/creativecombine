class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!

  def index
    @response = request.body.read
  end

  def twitch
    puts "Callback triggered"
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Twitch") if is_navigational_format?
    else
      session["devise.twitch_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname
      user.image_url = auth.info.image
      user.token = auth.credentials.token
      user.data['omniauth_info'] = auth
    end
  end
end
