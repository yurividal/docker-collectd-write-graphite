Hostname "{{ HOST_NAME }}"

FQDNLookup false
Interval {{ COLLECT_INTERVAL | default("10") }}
Timeout 2
ReadThreads 5

LoadPlugin interface
LoadPlugin network
LoadPlugin csv
LoadPlugin write_graphite

<Plugin"network">
    Listen"0.0.0.0"
</Plugin>

<Plugin interface>
  Interface "lo"
  Interface "/^veth.*/"
  Interface "/^docker.*/"
  IgnoreSelected true
</Plugin>

<Plugin"csv">
  DataDir"/var/lib/collectd/csv"
  StoreRatestrue
</Plugin>

<Plugin "write_graphite">
 <Carbon>
   Host "{{ GRAPHITE_HOST }}"
   Port "{{ GRAPHITEPORT | default("2003") }}"
   Prefix "{{ GRAPHITE_PREFIX | default("collectd.") }}"
   EscapeCharacter "_"
   SeparateInstances true
   StoreRates true
   AlwaysAppendDS false
 </Carbon>
</Plugin>

