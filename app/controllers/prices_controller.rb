class PricesController < ApplicationController
    layout 'sub_page'
    def index
      @setting = HomeSetting.first
    end
end
