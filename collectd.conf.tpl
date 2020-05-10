Hostname "{{ HOST_NAME }}"

FQDNLookup false
Interval {{ COLLECT_INTERVAL | default("10") }}
Timeout 2
ReadThreads 5

LoadPlugin interface
LoadPlugin network
LoadPlugin csv
LoadPlugin write_graphite

<Plugin network>
  <Listen "0.0.0.0" "{{ COLLECTD_LISTEN_PORT | default("25826") }}">
  </Listen>
  Forward true
  ReportStats true
</Plugin>

<Plugin interface>
  Interface "lo"
  Interface "/^veth.*/"
  Interface "/^docker.*/"
  IgnoreSelected true
</Plugin>

<Plugin csv>
        DataDir "/var/lib/collectd/csv"
        StoreRates false
</Plugin>

<Plugin "write_graphite">
 <Carbon>
   Host "{{ GRAPHITE_HOST }}"
   Port "{{ GRAPHITEPORT | default("2003") }}"
   Protocol "tcp"
#   Prefix "{{ GRAPHITE_PREFIX | default("collectd.") }}"
   EscapeCharacter "_"
 </Carbon>
</Plugin>
