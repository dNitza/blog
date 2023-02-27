module Adamantium
  module Views
    module Statuses
      class Index < Adamantium::View
        include Deps["repos.post_repo"]

        expose :posts do
          post_repo.statuses_listing.map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end
      end
    end
  end
end
