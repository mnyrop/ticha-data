require 'csv'
require 'fileutils'

def open_csv(file)
  CSV.open(file, headers: :first_row).map(&:to_h)
end

handwritten_expected  = open_csv './csv/handwritten_table.csv'
ticha_ids             = handwritten_expected.map { |i| i['Ticha ID'] }.uniq.sort
downloaded_pdf_slugs  = Dir.glob('./downloads/server/pdfs/*.pdf').map { |file| File.basename(file, File.extname(file)) }

ticha_ids.each do |ticha_id|
  if File.file? "./data/pdfs/#{ticha_id}.pdf"
    puts "skipping; #{ticha_id} already in dest folder"
  elsif downloaded_pdf_slugs.include? ticha_id
      puts "copying; found #{ticha_id}"
      FileUtils.cp "./downloads/server/pdfs/#{ticha_id}.pdf", './data/pdfs'
  else
    puts "skipping; didn't find #{ticha_id}"
  end
end

puts "\n\n\n\n"

result_slugs = Dir.glob('./data/pdfs/*.pdf').map { |file| File.basename(file, File.extname(file)) }
puts ticha_ids - result_slugs.uniq.sort 