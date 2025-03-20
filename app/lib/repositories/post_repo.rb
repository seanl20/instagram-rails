module Repositories
  class PostRepo
    def create(attrs:)
      Post.create!(attrs)
    end
  end
end
