class UsersController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "123", except: :index
 
    def index
    #   render plain: "Everyone can see me!"
    end
 
    def edit
    #   render plain: "I'm only accessible if you know the password,"
    end
end