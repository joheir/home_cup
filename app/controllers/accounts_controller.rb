class AccountsController < ApplicationController
  skip_before_action :authenticate_account!, only: :index

  def index
    @disable_nav = true
  end


end
