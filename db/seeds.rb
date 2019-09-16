require 'csv'

CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

CSV.foreach('db/KEN_ALL.CSV', encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[CSVROW_PREFNAME]
  cityName = row[CSVROW_CITYNAME]
  pref = Prefecture.find_or_create_by(:name => prefName)
  City.find_or_create_by(:name => cityName, prefecture_id: pref.id)
end

