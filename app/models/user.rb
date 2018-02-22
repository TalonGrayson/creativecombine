class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[twitch]

  def self.from_omniauth(auth)
    puts "Auth: " + auth.to_s
    puts '-------------------------------------'
    puts "UID: " + auth.uid.to_s
    puts "Email: " + auth.info.email.to_s
    puts "Display Name: " + auth.info.name.to_s
    puts "Logo: " + auth.info.image.to_s
    puts "Token: " + auth.uid.to_s
    puts '-------------------------------------'
    where(uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      #user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
      user.image_url = auth.info.image
      user.token = auth.credentials.token
      #user.data['omniauth_info'] = auth
    end
  end

end
