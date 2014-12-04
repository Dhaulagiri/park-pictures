module FileHelper
  def do_download_remote_photo(photo_url)
    io = open(URI.parse(URI.escape(photo_url)))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
    rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end
end
