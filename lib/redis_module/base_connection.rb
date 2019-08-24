require 'redis'

class RedisModule::BaseConnection
    attr_accessor :redis_instance

    def initialize()
        @redis_instance = Redis.new(host: "localhost")
    end

    def clear_cash(key)
        @redis_instance.del(key)
    end
end