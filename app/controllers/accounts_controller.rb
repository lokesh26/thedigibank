class AccountsController < ApplicationController
	before_action :authenticate_user!

	def unknown
		flash.notice = 'No page found at that address'
		redirect_to root_path
	end

	def show
	end
end
