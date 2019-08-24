class RedisModule::Setters < RedisModule::BaseConnection

    def set_key_value(key, value)
        @redis_instance.set(key, value)
    end
    
end