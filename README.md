# Air Condition API Helper (from : [https://www.data.go.kr])
- rubygems : http://rubygems.org/gems/air-condition-api

## Installation

```sh
gem install air-condition-api
```

## Usage
```ruby
require 'air-condition-api'

API_KEY = 'YOUR_API_KEY'
AREA_NAME = 'YOUT_AREA_NAME'

air_condition = AirCondition.new

air_condition.request_api_area(API_KEY, AREA_NAME) do |result, error|

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

```

