module DataHelpers
  require 'json'
  require 'fileutils'
  require 'gruff'

  def deny_report
    JSON.parse(File.read("_data/denyreport.json"))
  end

  def outdated_report
    JSON.parse(File.read("_data/outdated.json"))
  end

  def license_report
    JSON.parse(File.read("_data/licenses.json"))
  end

  def mk_static_path(filename)
    FileUtils.mkdir_p "static"
    "static/#{filename}"
  end

  # Returns the path to the written graph file
  def cargo_bloat_graph repo, target_path
    #g = Gruff::Line.new
    #g.title = "cargo-bloat file size"

    #cargo_bloat(repo).map do |obj|
    #  g.data obj["gitrev"], obj["data"]["file-size"]
    #end

    #g.write target_path
    #target_path
  end

end

