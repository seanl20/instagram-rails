# frozen_string_literal: true

module Posts
  module Commands
    class Create < Command
      def call(params:, user:)
        attrs = params[:photo] ? Posts::Changesets::Create.map(params).merge({
          photo: params[:photo], user:
        }) : Posts::Changesets::Create.map(params).merge({ user: })

        Repositories::PostRepo.new.create(attrs:)
      end
    end
  end
end
