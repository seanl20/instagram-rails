# frozen_string_literal: true

module Posts
  module Commands
    class Update < Command
      def call(id:, params:)
        update_post(id:, params:)

        Repositories::PostRepo.new.get(id:)
      end

      def update_post(id:, params:)
        attrs = Posts::Changesets::Create.map(params)

        Repositories::PostRepo.new.update(id:, attrs:)
      end
    end
  end
end
