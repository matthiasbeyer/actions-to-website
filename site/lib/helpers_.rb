use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::Blogging
use_helper Nanoc::Helpers::LinkTo
use_helper GitHelpers
use_helper GithubHelpers
use_helper DataHelpers

module Utils
  def with_base_url path
    @config[:base_url] + path
  end
end
use_helper Utils
