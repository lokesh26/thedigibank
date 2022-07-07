class ApplicationController < ActionController::Base
	before_action :set_cache_headers ,:set_current_account!
	layout :choose_layout

  def set_current_account!
    logger.debug { 'set_current_account!' }
    @account ||= current_user.account
  end  

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
  end  

	def choose_layout
    user_signed_in? ? 'dashboard' :  'application'
  end  
end
