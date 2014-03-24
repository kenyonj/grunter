class HomesController < ApplicationController
  def show
    @grunt = Grunt.new
    session[:return_to] ||= request.referer
  end
end
