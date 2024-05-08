class GitCoverageDataSource < GitDataSource
  require 'json'

  identifier :gitcoverage

  def items
    self.walker_for_first_parent("master")
      .map do |obj|
        h = {
          :oid => obj.oid,
          :message => obj.message,
          :committer => obj.committer,
          :author => obj.author,
        }

        new_item('', h, "/#{obj.oid}")
      end
  end
end
