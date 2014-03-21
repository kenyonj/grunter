class HomesController < ApplicationController
  before_action :authorize
  def show
    @grunt = Grunt.new
    @grunts = current_user.grunt_feed
    session[:return_to] ||= request.referer
  end
end
