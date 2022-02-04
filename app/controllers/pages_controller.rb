class PagesController < ApplicationController
    def home
      @heading = "Ruby Chat App"
    end   

    def login
      @heading = "Login"
    end   

    def login_credentials
      @heading = "Login with User Credentials"
    end      
       
    def login_credentials_submit
      @heading = "Submitted"
    end     
end
