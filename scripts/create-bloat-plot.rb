#!/usr/bin/env ruby

require "open3"
require "json"
require "charty"

data = Open3.popen3("git log --notes=cargo-bloat-report --format='%cI | %N'") do |stdin, stdout, stderr, waiter|
  stdin.close
  stdout.read.chomp
end
  .lines
  .reject { |line| line.strip.empty? }
  .filter { |line| line.include? "|" }
  .map do |line|
    split = line.split "|"
    date = split.shift
    data = JSON.parse split

    { date: date, data: data }
  end

