module GithubHelpers
  class GithubRepoLink
    def initialize owner, repo
      @owner = owner
      @repo = repo
    end

    def to_s
      "https://github.com/#{@owner}/#{@repo}"
    end

    def commit hash
      "https://github.com/#{@owner}/#{@repo}/commit/#{hash}"
    end

    def issues
      "https://github.com/#{@owner}/#{@repo}/issues"
    end

    def pulls
      "https://github.com/#{@owner}/#{@repo}/pulls"
    end
  end

end

