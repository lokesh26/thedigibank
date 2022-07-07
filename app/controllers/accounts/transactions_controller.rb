class Accounts::TransactionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @transaction = @account.transactions.build
  end
end
