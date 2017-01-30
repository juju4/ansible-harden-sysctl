require 'serverspec'

# Required by serverspec
set :backend, :exec

describe command('sysctl -p') do
#  its(:stdout) { should match /net.ipv4.icmp_echo_ignore_broadcasts = 1/ }
  its(:stdout) { should match /net.ipv4.conf.default.log_martians = 1/ }
  its(:stdout) { should match /net.ipv4.icmp_ratelimit = 100/ }
  its(:stdout) { should match /net.ipv4.conf.all.arp_ignore = 1/ }
  its(:stdout) { should_not match /error: / }
  its(:exit_status) { should eq 0 }
end

