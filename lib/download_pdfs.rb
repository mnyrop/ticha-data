require 'down'
require 'fileutils'

pdfs = File.read('./txt/handwritten/pdf.txt').gsub(/\R+/, ' ').split.sort

pdfs.each do |pdf|  
  tempfile = Down.download "https://ticha.haverford.edu/images/pdf/#{pdf}"
  FileUtils.mv tempfile.path, "./downloads/server/pdfs/#{tempfile.original_filename}"
  sleep 2
end



