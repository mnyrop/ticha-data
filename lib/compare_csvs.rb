require 'csv'

def open_csv(file)
  CSV.open(file, headers: :first_row).map(&:to_h)
end

def unique_parents(data)
  data.map { |i| i['inferred_parent'] }.uniq
end

# dzis = open_csv './csv/dzi.csv'
# jpgs = open_csv './csv/jpg.csv'
pdfs_found            = open_csv './csv/pdf.csv'
handwritten_expected  = open_csv './csv/handwritten_table.csv'

pdf_ids   = pdfs_found.map { |i| i['slug'] }.uniq.sort 
ticha_ids = handwritten_expected.map { |i| i['Ticha ID'] }.uniq.sort

puts ticha_ids - pdf_ids
puts "\n\n\n\n"
puts pdf_ids - ticha_ids



# dzi_no_jpg = unique_parents(dzis).sort - unique_parents(jpgs).sort
# pdf_no_jpg = unique_parents(pdfs).sort - unique_parents(jpgs).sort
# jpg_no_pdf = unique_parents(jpgs).sort - unique_parents(pdfs).sort

# puts "DZI (#{dzis.length}) BUT NOT JPG (#{jpgs.length}) [expected: #{dzis.length - jpgs.length} / actual]: #{dzi_no_jpg.length}]: #{dzi_no_jpg}\n\n\n"

# puts "PDF (#{pdfs.length}) BUT NOT JPG (#{jpgs.length}) [expected: #{pdfs.length - jpgs.length} / actual]: #{pdf_no_jpg.length}]: #{pdf_no_jpg}\n\n\n"

# puts "JPGS (#{jpgs.length}) BUT NOT PDF (#{pdfs.length}) [expected: #{jpgs.length - pdfs.length} / actual]: #{jpg_no_pdf.length}]: #{jpg_no_pdf}\n\n\n"
