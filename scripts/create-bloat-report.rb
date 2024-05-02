#!/usr/bin/env ruby

require "open3"
require "json"

gitrev = `git rev-parse HEAD`.chomp
shortrev = gitrev[0..10]

data = Open3.popen3("cargo bloat --crates --message-format json") do |stdin, stdout, stderr, waiter|
  stdin.close
  stdout.read.chomp
end

obj = {
  :gitrev => gitrev,
  :shortrev => shortrev,
  :data => JSON.parse(data)
}

puts obj.to_json
