class ApplicationController < ActionController::API
  #include JsonapiErrorsHandler
  
  #ErrorMapper.map_errors!({
  #volkan    'ActiveRecord::RecordNotFound' => 
      'JsonapiErrorsHandler::Errors::NotFound'
  #)
  #escue_from ::StandardError, with: lambda { |e| handle_error(e) }
  rescue_from UserAuthentication::AuthenticationError, with: :authentication_error

  private

 def authentication_error
   error = {
     "status" => "401",
     "source" => { "pointer" => "/code" },
     "title" => "Authentication code is invalid"
     "detail" => "You must provide valid code in order to exchange it for a token."
   }
   render json: { "errors": [ error ]}, status: 401
 end 
end
