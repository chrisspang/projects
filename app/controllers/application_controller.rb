class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :countries

  ## Return array of all supported countries
  def countries
    [ 'au', 'br', 'de', 'es', 'fr', 'in', 'it', 'mx', 'uk' ]
  end

end
