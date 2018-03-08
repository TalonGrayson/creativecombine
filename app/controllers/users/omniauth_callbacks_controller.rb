class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!

  def index
    @response = request.body.read
  end

  def twitch
    puts "Callback triggered"
    auth = request.env['omniauth.auth']
    @user = User.from_omniauth(auth)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      @user.update_user_info(auth)
      puts '-------------------------------------'
      puts 'User Details:'
      puts 'Email: ' + @user.email.to_s
      puts 'Username: ' + @user.username.to_s
      puts 'Image URL: ' + @user.image_url.to_s
      puts 'Broadcaster Type: ' + @user.broadcaster_type.to_s
      puts 'Description: ' + @user.description.to_s
      puts '-------------------------------------'
      set_flash_message(:notice, :success, kind: "Twitch") if is_navigational_format?
    else
      session["devise.twitch_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
