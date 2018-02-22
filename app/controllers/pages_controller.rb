class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    puts "Index showing"
  end

  def registered_users
  end
end
