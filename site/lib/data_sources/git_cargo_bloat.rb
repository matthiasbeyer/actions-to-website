class GitCargoBloatDataSource < GitDataSource
  require 'json'

  identifier :gitbloat

  def items
    self.walker_for_first_parent
      .each
      .to_a
      .map { |c| c.notes("refs/notes/cargo-bloat-report") }
      .reject(&:nil?)
      .map do |note|
        message = JSON.load(note[:message]).to_hash
        new_item('', message, "/#{message["gitrev"]}")
      end
  end
end

class GitCargoBloatGraphDataSource < GitCargoBloatDataSource
  require 'gruff'
  require 'json'

  identifier :gitbloatgraph

  def items
    g = Gruff::Line.new
    g.title = "cargo-bloat file size"

    self.walker_for_first_parent
      .each
      .to_a
      .map { |c| c.notes("refs/notes/cargo-bloat-report") }
      .reject(&:nil?)
      .map do |note|
        item = JSON.load(note[:message])
        g.data item["gitrev"], item["data"]["file-size"]
      end

    [
      new_item(g.to_image.to_blob, {}, "/cargobloat.png")
    ]
  end
end
