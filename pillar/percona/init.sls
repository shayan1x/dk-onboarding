percona_common:
  cluster_name: mycluster
  encryption: False
  slave_threads: 8

percona_cluster_workers:
  worker1:
    ip: 192.168.56.101
    name: cluster-db1

  worker2:
    ip: 192.168.56.102
    name: cluster-db2
 
  worker3:
    ip: 192.168.56.103
    name: cluster-db3

percona_haproxy_user:
  name: haproxy
  pwd: 1234