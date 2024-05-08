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
