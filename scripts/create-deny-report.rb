#!/usr/bin/env ruby

require "open3"
require "json"

gitrev = `git rev-parse HEAD`.chomp
shortrev = gitrev[0..10]

data = Open3.popen3("cargo deny --format json check all") do |stdin, stdout, stderr, waiter|
  stdin.close
  stderr.read.chomp
end
.lines
.map { |line| JSON.parse line }

obj = {
  :gitrev => gitrev,
  :shortrev => shortrev,
  :data => data
}

puts obj.to_json
