masterConf: {}

intermediateConf: 
    log_slave_updates: 'ON'
    # read_only: 'ON'
    # super_read_only: 'ON'
    slave_parallel_workers: 4

slaveConf:
    # read_only: 'ON'
    # super_read_only: 'ON'
    slave_parallel_workers: 4