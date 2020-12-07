class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  # layout proc { |controller| controller.user_signed_in? ? "inventory" : "application" }

  def index

  end

end