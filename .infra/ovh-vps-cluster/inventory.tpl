%{ for group in groups }
[${group}]
%{ for host in hosts ~}
%{ if host.group == group ~}
${host.name} ansible_host=${host.ip}
%{ endif ~}
%{ endfor ~}
%{ endfor }
