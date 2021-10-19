class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_PRODUCTS_USERNAME"], password: ENV["ADMIN_PRODUCTS_PASSWORD"]
end