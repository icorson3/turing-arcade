class Github < OpenStruct

  def self.service
    GithubService.new
  end

  def self.find_collaborators(owner, repo)
    collaborators = service.find_collaborators(owner, repo)
      collaborators.map do |collaborator|

        Github.new(collaborator)
    end
  end

end
