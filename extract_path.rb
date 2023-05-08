#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'

def clear_core(data)
  # keep = ['path', 'label']
  keep = ['path']
  json = JSON.parse(data)
  json['items'].each do |item|
    item.keep_if { |key, _| keep.include?(key) }
  end
  JSON.pretty_generate(json)
end

def clear_core_from_file(path)
  data = File.read(path)
  clear_core(data)
end

if __FILE__ == $PROGRAM_NAME
  print clear_core_from_file('content_favorites.lpl')
  return
end
