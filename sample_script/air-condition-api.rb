#!/usr/bin/env ruby
#
# air-condition-api.rb
#
# by hwj4477@gmail.com
#

require 'air-condition-api'

def print_usage

  puts "* usage: #{__FILE__} [APP_ID]"

end

def check_condition(api_key, area_name)


  air_condition = AirCondition.new

  air_condition.request_api_area(API_KEY, "서울") do |result, error|

    if result 

      air_condition.data.each do |data|
        puts "#{data.station_name}"
        puts "Today : #{data.condition_day}"
        puts "1Hour : #{data.condition_hour}"
        puts "--"
      end

    else

      puts "error : #{error}"

    end

  end

end

if __FILE__ ==  $0

  if ARGV.count == 2

    check_condition(ARGV[0], ARGV[1])

  else

    print_usage

  end

end
