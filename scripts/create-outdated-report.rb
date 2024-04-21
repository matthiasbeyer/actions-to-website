#!/usr/bin/env ruby

require "open3"
require "json"

gitrev = `git rev-parse HEAD`.chomp
shortrev = gitrev[0..10]

data = Open3.popen3("cargo outdated --format json") do |stdin, stdout, stderr, waiter|
  stdin.close
  stdout.read.chomp
end

data = JSON.parse data

obj = {
  :gitrev => gitrev,
  :shortrev => shortrev,
  :data => data
}

puts obj.to_json

