module OwnerHealth
  module Sync
    class BillableItem
      def self.call(setting)
        business = setting.business
        return false if setting&.api_key.blank?

        url = URI.parse('https://owner.health/api/v1/billable_items')
        req = Net::HTTP::Get.new(url.to_s)
        req['X-API-KEY'] = setting.api_key
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }

        if res.code == '200'
          billable_items = JSON.parse(res.body)['data']
          billable_items.each do |item|
            billable_item = business.billable_items.find_or_create_by owner_health_id: item['id']
            billable_item.assign_attributes name: item['attributes']['name'],
                                            item_number: item['attributes']['item_number'],
                                            price: item['attributes']['price']
            billable_item.save!
          end
          setting.update last_sync_billable_items_at: Time.now
          return true
        else
          return false
        end
      end
    end
  end
end