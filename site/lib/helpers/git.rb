module GitHelpers
  require 'rugged'
  require 'json'

  def load_repo
    @repo = Rugged::Repository.discover '.'
  end
end
