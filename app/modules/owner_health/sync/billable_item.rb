module OwnerHealth
  module Sync
    class BillableItem
      def self.call(setting)
        business = setting.business
        return false if setting&.api_key.blank?

        url = URI.parse('https://owner.health/api/marketplace/billable_items')
        req = Net::HTTP::Get.new(url.to_s)
        req['X-API-KEY'] = setting.api_key
        res = Net::HTTP.start(url.host, url.port, use_ssl: true) {|http|
          http.request(req)
        }
        
        if res.code == '200'
          billable_items = JSON.parse(res.body)['billable_items']
          billable_items.each do |item|
            billable_item = business.billable_items.find_or_create_by owner_health_id: item['id']
            billable_item.assign_attributes name: item['name'],
                                            item_number: item['item_number'],
                                            price: item['price'],
                                            business_name: item['business']['name']
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