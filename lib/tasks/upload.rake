require "#{Rails.root}/app/helpers/file_helper"
include FileHelper
require 'dropbox_sdk'
require 'open-uri'

namespace :upload_picture do

  namespace :rmnp do

    desc "Upload the divide"
    task glacier_basin: :environment do
      client = DropboxClient.new(ENV['DROPBOX_ACCESS_TOKEN'])
      image = do_download_remote_photo('http://www.nps.gov/webcams-romo/glacier_basin.jpg')
      time = Time.zone.now.iso8601
      time.gsub! '-', '_'
      time.gsub! ':', '_'
      response = client.put_file('/Park Pictures/RMNP/glacier_basin/glacier_basin_' + time +'.jpg', image)
    end

    desc "Upload Longs"
    task longs_peak: :environment do
      client = DropboxClient.new(ENV['DROPBOX_ACCESS_TOKEN'])
      image = do_download_remote_photo('http://www.nps.gov/webcams-romo/longs_peak.jpg')
      time = Time.zone.now.iso8601
      time.gsub! '-', '_'
      time.gsub! ':', '_'
      response = client.put_file('/Park Pictures/RMNP/longs/longs_' + time +'.jpg', image)
    end
  end


end
