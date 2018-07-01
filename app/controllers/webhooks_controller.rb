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

end