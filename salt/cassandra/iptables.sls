{% set internal_network = salt['pillar.get']('subnet', '192.168.0.0/8') -%}

Iptables 7000:
  iptables.insert:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 7000
    - source: {{ internal_network }}
    - in-interface: {{ vars.int_iface }}
    - proto: tcp
    - position: 3
    - save: True

Iptables 7199:
  iptables.insert:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 7199
    - source: {{ internal_network }}
    - in-interface: {{ vars.int_iface }}
    - proto: tcp
    - position: 3
    - save: True