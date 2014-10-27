class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  include FrontEnd
  include HtmlHandler

  def index
    @index_html = index_html

    render text: @index_html
  end

end
