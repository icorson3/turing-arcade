class GithubService

  def initialize
    @_conn = Faraday.new(url: "https://api.github.com") do |f|
      f.request  :url_encoded
      f.adapter  Faraday.default_adapter
    end
  end

  def find_collaborators(owner, repo)
    collaborators = conn.get do |collaborator|
      collaborator.url "/repos/#{owner}/#{repo}/contributors"

    end
    JSON.parse(collaborators.body)
  end

  private

    def conn
      @_conn
    end
end
