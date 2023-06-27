# mackerel-plugin-resolver-synthetic

mackerel plugin for moniting dns server as linux resolver

## Usage

```
# good
% ./mackerel-plugin-resolver-synthetic --timeout 5s -H 8.8.4.4 -H 8.8.8.8  -Q example.com
dnsdist-synthetic.service.available     100     1687868462
dnsdist-synthetic.rtt.milliseconds      16      1687868462

# one of them is alive
% ./mackerel-plugin-resolver-synthetic --timeout 5s -H 198.51.100.1 -H 198.51.100.2 -H 8.8.8.8  -Q example.com 
2023/06/27 21:20:08 failed to resolv on 198.51.100.1 with timeout 5.000000s: read udp 192.168.68.110:58507->198.51.100.1:53: i/o timeout
2023/06/27 21:20:11 failed to resolv on 198.51.100.1 with timeout 3.000000s: read udp 192.168.68.110:49304->198.51.100.1:53: i/o timeout
dnsdist-synthetic.service.available     100     1687868403
dnsdist-synthetic.rtt.milliseconds      8023    1687868403

# all dead

% ./mackerel-plugin-resolver-synthetic --timeout 5s -H 198.51.100.1 -H 198.51.100.2 -Q example.com 
2023/06/27 21:21:56 failed to resolv on 198.51.100.1 with timeout 5.000000s: read udp 192.168.68.110:51016->198.51.100.1:53: i/o timeout
2023/06/27 21:22:01 failed to resolv on 198.51.100.2 with timeout 5.000000s: read udp 192.168.68.110:59771->198.51.100.2:53: i/o timeout
2023/06/27 21:22:06 failed to resolv on 198.51.100.1 with timeout 5.000000s: read udp 192.168.68.110:53296->198.51.100.1:53: i/o timeout
2023/06/27 21:22:11 failed to resolv on 198.51.100.2 with timeout 5.000000s: read udp 192.168.68.110:50395->198.51.100.2:53: i/o timeout
dnsdist-synthetic.service.available     0       1687868511
dnsdist-synthetic.rtt.milliseconds      20002   1687868511
```

## Help

```
Usage:
  mackerel-plugin-resolver-synthetic [OPTIONS]

Application Options:
  -v, --version   Show version
      --prefix=   Metric key prefix (default: dnsdist)
  -H, --hostname= DNS server hostnames (default: 127.0.0.1)
  -Q, --question= Question hostname (default: example.com.)
  -E, --expect=   Expect string in result
      --timeout=  Timeout (default: 5s)
      --attempts= Number of resoluitions (default: 2)
      --deadline= Deadline timeout (default: 20s)

Help Options:
  -h, --help      Show this help message
```
