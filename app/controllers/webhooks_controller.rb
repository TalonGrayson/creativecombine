class WebhooksController < ApplicationController
  #skip_before_filter :verify_authenticity_token
  protect_from_forgery with: :null_session

  def receive
    if request.headers['Content-Type'] == 'application/json'
      @data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      @data = params.as_json
    end

    #Webhook::Received.save(data: data, integration: params[:integration_name])

    puts 'EVENT: ' + @data['event'].to_s
    puts 'NAME: ' + @data['name'].to_s

    render :status => :ok
  end

  def twitch_subscribe

    url = URI.parse('https://api.twitch.tv/helix/webhooks/hub')
    req = Net::HTTP::Post.new(url.request_uri, 'Client-ID' => ENV['TWITCH_CLIENT_ID'], 'Content-Type' => 'application/json')
    req.body = { "hub.mode": "subscribe",
                 "hub.topic":"https://api.twitch.tv/helix/users/follows?to_id=TalonGrayson",
                 "hub.callback":"http://127.0.0.1:3000/users/auth/twitch/callback",
                 "hub.lease_seconds":"864000",
                 "hub.secret": ENV['TWITCH_CLIENT_SECRET']
    }.to_json
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    response = http.request(req)
    puts response.to_s

  end

end