class GruntsController < ApplicationController
  def index
    @followed_grunts = current_user.grunt_feed
  end

  def show
  end

  def new
    @grunt = Grunt.new
    session[:return_to] ||= request.referer
  end

  def create
    @grunt = current_user.grunts.new(grunt_params)
    if @grunt.save
      redirect_to session.delete(:return_to)
    else
      render :new
    end
  end

  def destroy
    grunt = find_grunt
    grunt.destroy
    redirect_to current_user
  end

  private

  def find_grunt
    current_user.grunts.find(params[:id])
  end

  def grunt_params
    params.
      require(:grunt).
      permit(
        :body
      )
  end
end
