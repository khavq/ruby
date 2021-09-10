require "zlib"

string = File.open("./base64.txt").read
p string.bytesize

#def write_object(oid, content)
  #Zlib::Deflate.deflate(content, Zlib::BEST_SPEED)
#end

#def store(object)
  #type = "blob"
  #string = object.to_s.force_encoding(Encoding::ASCII_8BIT)
  #content = "#{ type } #{ string.bytesize }\0#{ string }"
  #write_object(1, content)
#end

#p store(string).bytesize
