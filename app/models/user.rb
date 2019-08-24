class User < ApplicationRecord
    after_commit :clear_cache

    def clear_cache
        $redis.del("users")
    end
end