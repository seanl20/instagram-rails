module Repositories
  class PostRepo
    def create(attrs:)
      Post.create!(attrs)
    end

    def get(id:)
      Post.find(id)
    end
  end
end
