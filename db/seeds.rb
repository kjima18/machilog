require 'csv'
require 'zip'

DLURL           = "https://www.post.japanpost.jp/zipcode/dl/oogaki/zip/ken_all.zip"
SAVEDIR         = "db/"
CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

savePath = ""

open(URI.escape(DLURL)) do |file|
  ::Zip::File.open_buffer(file.read) do |zf|
    zf.each do |entry|
      savePath = SAVEDIR + entry.name
      zf.extract(entry, savePath) { true }
    end
  end
end


CSV.foreach(savePath, encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[CSVROW_PREFNAME]
  cityName = row[CSVROW_CITYNAME]
  pref = Prefecture.find_or_create_by(:name => prefName)
  City.find_or_create_by(:name => cityName, prefecture_id: pref.id)
end

File.unlink savePath