#!/usr/bin/env ruby
#
# todo.rb
# Written by Enrique Santos (me@enriquesantos.net)
# Based on todo.txt by Gina Trapani
#

case ARGV[0]
    when "a"
        item = ARGV[1] + "\n"
        File.open("todo.txt", 'a+') {|f| f.write(item) }
    when "ls"
        if !ARGV[1]
            count = 0
            file = File.new("todo.txt", "r")
            while line = file.gets
                puts "#{count} #{line}"
                count = count + 1
            end
            file.close
        else
            count = 0
            file = File.new("todo.txt", "r")
            while line = file.gets
                if line.match(ARGV[1])
                    puts "#{count} #{line}"
                    count = count + 1
                end
            end
            file.close
            puts "--\n"
            puts "#{count} tasks matched your query"
        end
    when "rm"
        if !ARGV[1]
            puts "usage: todo.rb rm (task #)"
        else
            remove = Integer(ARGV[1])
            count = 0
            new_list = ""
            file = File.new("todo.txt", "r")
            while line = file.gets
                if count != remove
                    new_list = new_list + "#{line}"
                end
                count = count + 1
            end
            file.close
            
            file = File.new("todo.txt", "w")
            file.write(new_list)
            file.close
        end
    when "do"
        if !ARGV[1]
            puts "usage: todo.rb do (task #)"
        else
            remove = Integer(ARGV[1])
            count = 0
            new_list = ""
            done_list = ""
            file = File.new("todo.txt", "r")
            while line = file.gets
                if count != remove
                    new_list = new_list + "#{line}"
                else
                    done_list = done_list +  "#{line}"
                end
                count = count + 1
            end
            file.close
            
            file = File.new("todo.txt", "w")
            file.write(new_list)
            file.close
            
            file = File.new("done.txt", "a+")
            file.write(done_list)
            file.close
        end
end

