#playground and autorunner test
#before_action :set_text


def save_text
    puts @text

    require 'fileutils'
    mydirname = "data/folder"
    new_file = "hello_world.txt"
    FileUtils.mkdir_p(mydirname) unless Dir.exists?(mydirname)
    f = File.open(File.join(Dir.pwd, mydirname, new_file),"w+")
      f.write (@text)
      puts f.size
      f.close


    puts "path: " + f.path
end


def set_text
  @text = "text: hello !world"
end

set_text
save_text
