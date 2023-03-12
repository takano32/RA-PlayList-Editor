#!/usr/bin/env ruby

require 'json'

def clear_core(data)
  # keep = ['path', 'label']
  keep = ['path']
  json = JSON.parse(data)
  json['items'].each do |item|
    item.keep_if {|key, value| keep.include?(key)}
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


