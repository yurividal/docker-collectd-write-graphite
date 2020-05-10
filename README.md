collectd-write-graphite
=======================

Basic collectd-based server monitoring. Sends stats to Graphite.

Collectd metrics:

* CPU used/free/idle/etc
* Network (Listens to Network Inputs (For Cisco VCS Monitoring)

Environment variables
---------------------

* `HOST_NAME`
  - Will be sent to Graphite
  - Required
* `COLLECTD_LISTEN_PORT`
  - Port to Listen to Network collection
  - Optional. Default 25826
* `GRAPHITE_HOST`
  - Graphite IP or hostname
  - Required
* `GRAPHITEPORT`
  - Graphite port
  - Optional, defaults to 2003
* `GRAPHITE_PREFIX`
  - Graphite prefix
  - Optional, defaults to collectd.
* `REPORT_BY_CPU`
  - Report per-CPU metrics if true, global sum of CPU metrics if false (details: [collectd.conf man page](https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_cpu))
  - Optional, defaults to false.
* `COLLECT_INTERVAL`
  - Collection interval and thus resolution of metrics
  - Optional, defaults to 10
