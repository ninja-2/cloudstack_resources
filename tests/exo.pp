#
# transport object, manages connections to cloudstack API server
#
#cloudstack_transport { 'transport1': }

# this requires advanced zones
#cloudstack_firewall_rule {
#
#}

#cloud_portforward_rule {
#
#}

# this does not

# I need a basic zone to deploy this into

#cloudstack_security_group { 'foo':
#  ensure => present,
#}

#volume {
#
#}

#resources { 'cloudstack_instance':
#  purge => true
#}

# ssh_transport {
#
# }

#cloudstack_security_group { 'default':
#  ensure => 'present',
#  ingress_rules => [{'cidr' => '0.0.0.0/0', 'endport' => '22', 'protocol' => 'tcp', 'startport' => '22'}]
#}

cloudstack_instance { 'pp':
  ensure             => 'present',
  flavor             => 'Micro',
  image              => 'Linux Ubuntu 12.04 LTS 64-bit 10GB Disk',
  zone               => 'AZ1',
}

#cloudstack_security_group { 'app1':
#  ensure        => 'present',
#  ingress_rules => [{'cidr' => '0.0.0.0/0', 'endport' => '22', 'protocol' => 'tcp', 'startport' => '22'}],
#}


cloudstack_instance { 'xxxxx':
  name		     => 'xxxxxx',
  ensure             => 'present',
  flavor             => 'Micro',
  image              => 'Linux Ubuntu 12.04 LTS 64-bit 10GB Disk',
  zone               => 'AZ1',
  group		     => 'ssh'
}

cloudstack_instance { 'vm1':
  name		     => 'vm1',
  ensure             => 'present',
  flavor             => 'Micro',
  image              => 'Linux Ubuntu 12.04 LTS 64-bit 10GB Disk',
  zone               => 'AZ1',
}

cloudstack_instance { 'vm2':
  name		     => 'vm2',
  ensure             => 'present',
  state             => 'running',
  flavor             => 'Micro',
  image              => 'Linux CentOS 6.3 64-bit 10GB Disk',
  zone               => 'AZ1',
}

cloudstack_instance { 'vm3':
  name		     => 'vm3',
  ensure             => 'present',
  state             => 'stopped',
  flavor             => 'Micro',
  image              => 'Linux CentOS 6.3 64-bit 10GB Disk',
  zone               => 'AZ1',
}

cloudstack_instance { 'vm4':
  name		     => 'vm4',
  ensure             => 'present',
  flavor             => 'Micro',
  image              => 'Linux CentOS 6.3 64-bit 10GB Disk',
  zone               => 'AZ1',
}

#cloudstack_instance { 'foo1':
#  ensure     => present,
#  flavor     => 'Small Instance',
#  zone       => 'FMT-ACS-001',
#  image      => 'CentOS 5.6(64-bit) no GUI (XenServer)',
#  network    => 'puppetlabs-network',
#  # domain
  # account
  # hostname
#}

#cloudstack_instance { 'foo2':
#  ensure     => present,
#  flavor     => 'Small Instance',
#  zone       => 'FMT-ACS-001',
#  image      => 'CentOS 5.6(64-bit) no GUI (XenServer)',
#  network    => 'puppetlabs-network',
#  group      => 'foo2',
#}


#cloudstack_ssh {
#  classes => {}
#  modules => []
#  ssh_transport =>
#  machine => Cloudstack_instnace['foo1'],
#  type => 'agent'
#}

#
# should I create a domain?
#
