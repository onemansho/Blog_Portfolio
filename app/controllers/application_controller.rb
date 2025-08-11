class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #allow_browser versions: :modern
  
  
  include DeviseWhitelist

  include SetSource

  include CurrentUserConcern

  include DefaultPageContent
  before_action :set_copyright
  
  def set_copyright
    @copyright= PortfolioViewTool::Renderer.copyright 'Haris Ali', 'All rights reserved'
  end
  
end
module PortfolioViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b>  #{msg}".html_safe
    end
  end
end