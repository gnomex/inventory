require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :redirect_not_found

  before_action :authenticate_pelego!
  before_action :set_locale

  self.responder = ApplicationResponder
  respond_to :html, :json

  private
  def redirect_not_found
    yield
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
