require "dry/monads"

module Adamantium
  module Commands
    module Posts
      class CreateBookmark < Command
        include Deps["repos.post_repo",
          syndicate: "commands.posts.syndicate"
        ]

        include Dry::Monads[:result]

        def call(bookmark)
          created_bookmark = post_repo.create(bookmark)

          syndicate.call(created_bookmark.id, bookmark)

          Success(created_bookmark)
        end
      end
    end
  end
end
