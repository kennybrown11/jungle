class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def show
  end

  def authentication_request(controller, realm)
    super
    controller.response_body = "test.\n"
   end

end
