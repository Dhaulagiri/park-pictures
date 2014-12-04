require "#{Rails.root}/app/helpers/file_helper"
include FileHelper
require 'dropbox_sdk'
require 'open-uri'

namespace :upload_picture do

  namespace :rmnp do

    desc "Upload the divide"
    task glacier_basin: :environment do
      client = DropboxClient.new(DROPBOX_ACCESS_TOKEN)
      image = do_download_remote_photo('http://www.nps.gov/webcams-romo/glacier_basin.jpg')
      time = Time.zone.now.iso8601
      response = client.put_file('/Park Pictures/RMNP/glacier_basin/glacier_basin_' + time +'.jpg', image)
    end

    task
  end


end