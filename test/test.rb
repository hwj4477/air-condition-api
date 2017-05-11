require 'air-condition-api'

API_KEY = "zMPmlK3JuP5j%2Fgri4LJG%2FR0%2F44lyxD3UDPvaaRa8MAPxj8plb1F9RsBqqXbo92a60%2Fg79Y8S6ZixySJYV6m8XA%3D%3D"

air_condition = AirCondition.new

air_condition.request_api_area(API_KEY, "서울") do |result, error|

  air_condition.data.each do |data|

    puts "#{data.station_name}"
    puts "Today : #{data.condition_day}"
    puts "1Hour : #{data.condition_hour}"
    puts "--"

  end

end
