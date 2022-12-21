class ApplicationController < ActionController::API
    @parents = Parent.all

    render json: @parents, status: :ok
end
