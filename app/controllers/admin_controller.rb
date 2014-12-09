#require 'nokogiri'

class AdminController < ApplicationController
  def update_styles
    page = Nokogiri::HTML(RestClient.get(ENV.fetch('LIVE_WEBSITE_FOR_STYLE_SCRAPING')))
    p page.css('head').to_xhtml
  end
end
