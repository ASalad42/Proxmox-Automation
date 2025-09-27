# Monitoring 

- cadvisor:8082 → container metrics
- node_exporter:9100 → VM metrics
- pve_exporter:9221 → Proxmox metrics
- prometheus:9090 → self-metrics
- `docker network create homelab`
- On the left sidebar → Gear Icon (⚙️) → Data Sources → Add data source. in the same Docker network so http://prometheus:9090
- https://grafana.com/grafana/dashboards/10347-proxmox-via-prometheus/
- https://github.com/prometheus-pve/prometheus-pve-exporter