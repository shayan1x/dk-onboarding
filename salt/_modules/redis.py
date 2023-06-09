try:
    import redis
    REDIS_MOD = True
except:
    REDIS_MOD = False

__virtualname__ = "redis"

def __virtual__():
    if ('StrictRedis' not in redis.__all__ ) or (not REDIS_MOD):
        return (False, "Redis module should be installed!")
    return __virtualname__


def _connect(host, port, password = None):
    return redis.StrictRedis(host, port, password=password)

def config_get(key, host = "127.0.0.1", port = 6379, password = None):
    connection = _connect(host, port, password)
    return connection.config_get(key)

def config_get_all(host = "127.0.0.1", port = 6379, password = None):
    return config_get("*", host, port, password)

def config_set(key, value, rewrite = True , host = "127.0.0.1", port = 6379, password = None):
    if key.lower() == "replicaof":
        return False
    connection = _connect(host, port, password)
    connection.config_set(key, value)
    if rewrite:
        connection.config_rewrite()
    return True

def config_set_all(configs: dict[str, str], rewrite = True, host = "127.0.0.1", port = 6379, password = None):
    connection = _connect(host, port, password)
    result = []
    for key, value in configs.items():
        result.append(
            connection.config_set(key, value)
        )
    if rewrite:
        connection.config_rewrite()
    return result

def role(host = "127.0.0.1", port = 6379, password = None):
    connection = _connect(host, port, password)
    return connection.role()[0]    