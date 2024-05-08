class GitDataSource < ::Nanoc::DataSource
  require 'rugged'

  identifier :git

  def up
    @repo = Rugged::Repository.discover '.'
  end

  def walker_for_first_parent master="master"
    walker = Rugged::Walker.new @repo
    walker.simplify_first_parent
    begin
      branch = @repo.branches[master].target.oid
    rescue NoMethodError
      branch = @repo.branches["origin/#{master}"].target.oid
    end
    walker.push branch
    walker
  end
end
