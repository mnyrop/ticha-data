require 'csv'

def open_as_array(path)
  File.read(path).gsub(/\R+/, ' ').split.sort
end

def hash(file)
  slug = File.basename(file, File.extname(file))
  {
    'file' => file,
    'slug' => slug,
    'inferred_parent' => slug.split('_').first
  }
end

def write_to_csv(path, data)
  CSV.open(path, 'wb') do |csv|
    csv << data.first.keys
    data.each do |hash|
      csv << hash.values
    end
  end
end

dzi_path  = './txt/handwritten/dzi.txt'
jpg_path  = './txt/handwritten/jpg.txt'
pdf_path  = './txt/handwritten/pdf.txt'

dzis = open_as_array(dzi_path).map { |file| hash(file) }
jpgs = open_as_array(jpg_path).map { |file| hash(file) }
pdfs = open_as_array(pdf_path).map { |file| hash(file) }

write_to_csv './csv/dzi.csv', dzis
write_to_csv './csv/jpg.csv', jpgs
write_to_csv './csv/pdf.csv', pdfs