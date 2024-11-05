require 'down'
require 'fileutils'

jpgs = File.read('./txt/handwritten/jpg.txt').gsub(/\R+/, ' ').split.sort

jpgs.each do |jpg|  
  tempfile = Down.download "https://ticha.haverford.edu/images/jpg/#{jpg}"
  FileUtils.mv tempfile.path, "./downloads/server/jpgs/#{tempfile.original_filename}"
  sleep 1
end
