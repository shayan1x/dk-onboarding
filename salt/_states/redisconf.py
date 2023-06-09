def __virtual__():
    if "redis.config_set" in __salt__:
        return True
    return (False, "redis module could not be loaded")

def present(name, value, rewrite = True , redis_host = "127.0.0.1", redis_port = 6379, redis_password = None):
    ret = {
        "name": name,
        "changes": {},
        "result": True,
        "comment": "There is nothing to update in the redis configuration"
    }

    current_config = __salt__["redis.config_get"](
        name,
        redis_host,
        redis_port,
        redis_password
    )

    if name in current_config and str(current_config[name]).lower() == str(value).lower():
        ret["comment"] = "Config {} with value {} is already present in redis configuration".format(name, value)
        ret["changes"] = {}
        
        return ret

    result = __salt__["redis.config_set"](
        name,
        value,
        rewrite,
        redis_host,
        redis_port,
        redis_password
    )

    if result:
        ret["changes"][name] = value
        ret["comment"] = "Config {} with value {} has updated in redis configuration".format(name, value)

    return ret