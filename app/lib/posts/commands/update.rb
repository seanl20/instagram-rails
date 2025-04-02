# frozen_string_literal: true

module Posts
  module Commands
    class Update < Command
      def call(id:, params:)
        post = Repositories::PostRepo.new.get(id:)

        update_post(id:, params:, post:)

        Repositories::PostRepo.new.get(id:)
      end

      def update_post(id:, params:, post:)
        if post.height == nil && post.width == nil
          attrs = crop_photo(params:, post:)
        else
          attrs = Posts::Changesets::Create.map(params)
        end

        Repositories::PostRepo.new.update(id:, attrs:)
      end

      def crop_photo(params:, post:)
        if post.photo.metadata["width"] && post.photo.metadata["height"]
          attrs = {
            status: params[:status],
            x_offset: (params[:x_offset].to_f/1200) * post.photo.metadata["width"],
            y_offset: (params[:y_offset].to_f/1200) * post.photo.metadata["height"],
            width: (params[:width].to_f/1200) * post.photo.metadata["width"],
            height: (params[:height].to_f/1200) * post.photo.metadata["height"],
            filter_name: params[:filter_name]
          }
        else
          attrs = Posts::Changesets::Create.map(params)
        end
        attrs
      end
    end
  end
end
