path  = './txt/handwritten/dzi.txt'
files = File.read(path).gsub(/\R+/, ' ').split
dzis  = files.select{ |file| file.end_with? '.dzi' }

File.open(path, 'w+') { |f| f.puts dzis }
