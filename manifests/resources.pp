# == Class: ufw::resources
#
# Instantiate ufw resources from parameters.
#
# Written to be used with Hiera.
#
# === Parameters
#
# Document parameters here.
#
# [*allow*]
#   Hash of rules to be permitted, of the form: {<name>: {from: <from>,
#   ip: <ip>, proto: <proto>, port: <port>}}
#
# [*deny*]
#   Hash of rules to be denied, of the form: {<name>: {from: <from>,
#   ip: <ip>, proto: <proto>, port: <port>}}
#
# [*limit*]
#   Hash of rules to be limited, of the form: {<name>: {proto: <proto>}}
#
# === Examples
#
# class { 'ufw::resources':
#   allow => { 'dns_tcp' => { 'proto' => 'tcp', 'port' => 53 },
#              'dns_udp' => { 'proto' => 'udp', 'port' => 53 } },
# }
#
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2012 Andrew Leonard
#
class ufw::resources(
  $allow = hiera_hash('ufw_allow'),
  $deny = hiera_hash('ufw_deny'),
  $limit = hiera_hash('ufw_limit')
  ){

  create_resources(ufw::allow, $allow)

  create_resources(ufw::deny, $deny)

  create_resources(ufw::limit, $limit)
}
