module Rumbambar
  class ApiController < Rumbambar::ApplicationController

    def index
      render json: [{id: 1, name: 'Name'}]
    end
  
    def show
      render json: {id: 1, name: 'Name'}
    end
  
    def create
      render json: {id: 1}
    end
  
    def update
      render json: {id: 1}
    end
  
    def delete
      head :ok
    end
  end
end
