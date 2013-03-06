 class WelcomeController < ApplicationController
  before_filter :authenticate_user!

   def index
     @consumer_tokens = TestToken.all :conditions=>{:user_id=>current_user.id}
     @token = @consumer_tokens.first.client
     puts "private data: "+@token.get("/api/v1/principals/list").body
   end

 end
