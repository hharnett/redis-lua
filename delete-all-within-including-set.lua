--[[
	Delete all keys within a Set, including the Set itself
--]]
if redis.call("EXISTS", KEYS[1]) == 1 then
        local keys = redis.call("SMEMBERS", KEYS[1]);
        for _,v in ipairs(keys) do
                redis.call("DEL", v)
        end

        redis.call("DEL", KEYS[1])

        return 1

else
        return nil
end