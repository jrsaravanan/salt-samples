open_port:
 iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 3306
    - proto: tcp
    - save: True
