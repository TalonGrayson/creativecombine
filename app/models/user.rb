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
    puts "Logo: " + auth.info.image_url.to_s
    puts "Broadcaster Type: " + auth.extra.raw_info.data[0].broadcaster_type.to_s
    puts "Description: " + auth.info.description.to_s
    puts "Token: " + auth.uid.to_s
    puts '-------------------------------------'
    where(uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20] # Because it can't be blank..
      user.email = auth.info.email
      user.username = auth.info.name
      user.image_url = auth.info.image_url
      user.token = auth.credentials.token
      #NEED TO ADD:
      #user.broadcaster_type = auth.raw_info.data.broadcaster_type
      #user.data['omniauth_info'] = auth
    end
  end

end
