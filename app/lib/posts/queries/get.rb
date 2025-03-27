# frozen_string_literal: true

module Posts
  module Queries
    class Get < Query
      def call(id:)
        Repositories::PostRepo.new.get(id:)
      end
    end
  end
end
