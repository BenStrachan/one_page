class PricesController < ApplicationController
    layout 'sub_page'
    def index
      @setting = HomeSetting.first
      @billable_items = BillableItem.order(practitioner_full_name: :asc)
    end
end
