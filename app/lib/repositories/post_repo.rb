module Repositories
  class PostRepo
    def create(attrs:)
      Post.create!(attrs)
    end

    def get(id:)
      Post.find(id)
    end

    def update(id:, attrs:)
      Post
        .find(id)
        .update!(attrs)
    end
  end
end
