module GitHelpers
  require 'rugged'
  require 'json'

  def load_repo
    Rugged::Repository.discover '.'
  end

  def walker_for_first_parent repo, master="master"
    walker = Rugged::Walker.new(repo)
    walker.simplify_first_parent
    walker.push repo.branches[master].target.oid
    walker
  end

  def git_notes walker, ref
    walker.each
      .to_a
      .map { |c| c.notes("refs/notes/cargo-bloat-report") }
      .reject &:nil?
  end

  def cargo_bloat
    repo = load_repo
    walker = walker_for_first_parent repo

    git_notes(walker, "refs/notes/cargo-bloat-report").map do |note|
      JSON.load note[:message]
    end
  end

end
