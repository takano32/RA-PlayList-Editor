#!/usr/bin/env ruby

require 'json'

def clear_core(data)
  json = JSON.parse(data)
  json['items'].each do |item|
    item['core_path'] = ""
    item['core_name'] = ""
  end
  JSON.pretty_generate(json)
end

def clear_core_from_file(path)
  data = File.read(path)
  clear_core(data)
end

if __FILE__ == $0
  print clear_core_from_file('content_favorites.lpl')
end


