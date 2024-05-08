use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::Blogging
use_helper Nanoc::Helpers::LinkTo
use_helper GitHelpers
use_helper GithubHelpers
use_helper DataHelpers

module Utils

  def default_env?
    @config.env_name.nil? || @config.env_name == "default"
  end

  def get_env
    if default_env?
      @config
    else
      @config[:environments][@config.env_name.to_sym]
    end
  end

  def env_base_url
    get_env[:base_url] || ""
  end

  def with_base_url path
    env_base_url + path
  end
end
use_helper Utils
