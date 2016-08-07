#
# Cookbook Name:: ephemral_ports
# Recipe:: range_increase
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "add ports sysctl" do
  command sysctl -w "net.ipv4.ip_local_port_range=20000  64000"
end

execute "sysctlp" do
  command sysctl -p
end

execute "add ports to file" do
  command echo "net.ipv4.ip_local_port_range = 20000  64000" >> /etc/sysctl.conf
  not_if 'grep 64000 /etc/sysctl.conf'
  notifies :run, 'execute[sysctlp]', :immediately
end


