module DataHelpers
  require 'json'

  def deny_report
    JSON.parse(File.read("_data/denyreport.json"))
  end

  def outdated_report
    JSON.parse(File.read("_data/outdated.json"))
  end

  def license_report
    JSON.parse(File.read("_data/licenses.json"))
  end
end

