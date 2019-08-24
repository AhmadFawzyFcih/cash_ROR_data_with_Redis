class User < ApplicationRecord
    after_commit :clear_cache

    def clear_cache
        RedisModule::BaseConnection.new.clear_cash("users")
    end
end