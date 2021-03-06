﻿# level 1
"Jimmy".reverse
"Jimmy".length
"Jimmy"*5
# level 2
40.to_s.reverse
[12, 47, 35]
[12, 47, 35].max
ticket = [12, 47, 35]
ticket.sort!
# level 3
poem['toast'] = 'honeydew'
poem.reverse
poem.lines.to_a.reverse
print poem.lines.to_a.reverse.join
poem.include? "my hand"
poem.downcase
poem.delete
# level 4 - hashes, symbols and blocks
# 'hash' or 'dictionary'
books = {}
books["Gravity's Rainbox"] = :splendid
# ":splendid" is a symbol; cheaper than string ('cause stores by reference, not value)
books.length
books["Gravity's Rainbox"]
books.keys
ratings = Hash.new(0)
books.values.each {|rate| ratings[rate] += 1}
ratings #shows group by rating
5.times {print "Odelay!"}
# level 5 - Files 
Dir.entries "/"
Dir["/*.txt"]
print File.read("/comics.txt")
FileUtils.cp('/comics.txt', '/Home/comics.txt')
Dir["/Home/*.txt"]
File.open("/Home/comics.txt", "a") do |f|
f << "Cat and Girl"
end
File.mtime("/Home/comics.txt")
File.mtime("/Home/comics.txt").hour
# level 6 - creating methods, using libs
def load_comics( path )
  comics = {}
  File.foreach(path) do |line|
    name, url = line.split(': ')
    comics[name] = url.strip
  end
  comics
end
require 'popup'
Popup.goto "http:/bing.com"

Popup.make {
  h1 "My Links"
  link "Go to Bing", "http://bing.com"
}

Popup.make do
  h1 "Things to do"
  list do
    p "Try out Ruby"
    p "Ride a tiger"
    p "Down River"
  end
end

Popup.make do 
  h1 "Comics on the Web"
  list do
    comics.each do |name, url|
      link name, url
    end
  end
end
# level 7 - Classes, accessors, instance variables
class BlogEntry
  attr_accessor :title, :time, :fulltext, :mood
end

entry = BlogEntry.new
entry.title = "today mt. hood was stolen!"
entry.time = Time.now
entry.mood = :sick
entry.fulltext = "I can't believe it's stolen!"

# default attribute value
class BlogEntry
  def initialize (  title, mood, fulltext)
    # called 'instance variables'
    @time = Time.now
    @title, @mood, @fulltext = title, mood, fulltext
  end
end

BlogEntry.new

entry2 = BlogEntry.new("I left my hoodie", :confused, "yes i left it")

# level 8 - array methods
blog = [entry, entry2]

blog.sort_by { |entry| entry.time}.reverse
blog.find_all { |entry| entry.fulltext.match(/cadillac/i)}
blog << new_entry

blog.map { |entry| entry.mood}

blog.each do |entry|
  Popup.make do   
    h1 'My blog'
    h2 entry.title
    p entry.fulltext
    p entry.time
  end
end