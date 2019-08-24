class RedisModule::Getters < RedisModule::BaseConnection
    def get_key_value(key)
        @redis_instance.get(key)
    end
end