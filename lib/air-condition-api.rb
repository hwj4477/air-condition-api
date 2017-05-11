#
# Air Condition API Helper
# 
# last update 2017.05.11
#
# hwj4477@gmail.com
#

require 'net/http'
require 'uri'
require 'oga'

REQUEST_API = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/"

API_AREA = "#{REQUEST_API}getCtprvnRltmMesureDnsty"

class AirCondition

  attr_accessor :data

  def request_api_area(api_key, area_name)
    
    param = Hash.new
    param["serviceKey"] = URI.unescape(api_key)
    param["sidoName"] = area_name
    param["ver"] = 1.3

    uri = URI.parse(API_AREA)
    uri.query = URI.encode_www_form(param)

    response = Net::HTTP.get_response(uri)

    unless response.code.to_i == 200

      yield false, response.body

      return
    end
   
    # parse data
    xml_data = Oga.parse_xml(response.body)
    self.data = Array.new

    xml_data.xpath('response/body/items/item').each do |item|

      station_name = item.at_xpath('stationName').text
      condition_day = item.at_xpath('pm10Grade').text.to_i
      condition_hour = item.at_xpath('pm10Grade1H').text.to_i

      self.data.push ConditionData.new(station_name, condition_day, condition_hour)
    end

    yield true, nil

  end

end

class ConditionData

  attr_accessor :station_name, :condition_day, :condition_hour

  def initialize(station_name, condition_day, condition_hour)
    @station_name = station_name
    @condition_day = condition_day
    @condition_hour = condition_hour
  end
end
