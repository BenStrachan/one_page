module OwnerHealth
  module Sync
    class Practitioner
      def self.call(setting)
        business = setting.business
        return false if setting&.api_key.blank?

        url = URI.parse('https://owner.health/api/marketplace/practitioners')
        req = Net::HTTP::Get.new(url.to_s)
        req['X-API-KEY'] = setting.api_key
        res = Net::HTTP.start(url.host, url.port, use_ssl: true) {|http|
          http.request(req)
        }
        
        if res.code == '200'
          practitioners = JSON.parse(res.body)['practitioners']
          practitioners.each do |item|
            pract = business.practitioners.find_or_create_by owner_health_id: item['id']
            pract.assign_attributes first_name: item['first_name'],
                                    last_name: item['last_name'],
                                    profession: item['profession'],
                                    summary: item['summary'],
                                    registration: item['city'],
                                    business_name: item['business']['name']

            if item['avatar'].present?
              pract.avatar = URI.parse item['avatar']
            end
            pract.save!
          end
          setting.update last_sync_practitioners_at: Time.now
          return true
        else
          return false
        end
      end
    end
  end
end