amazon_side_asn = "64512"

azs = []

cidr = "10.0.0.0/16"

create_database_internet_gateway_route = false

create_database_nat_gateway_route = false

create_database_subnet_group = true

create_database_subnet_route_table = false

create_egress_only_igw = true

create_elasticache_subnet_group = true

create_elasticache_subnet_route_table = false

create_flow_log_cloudwatch_iam_role = false

create_flow_log_cloudwatch_log_group = false

create_igw = true

create_redshift_subnet_group = true

create_redshift_subnet_route_table = false

create_vpc = true

customer_gateway_tags = {}

customer_gateways = {}

customer_owned_ipv4_pool = null

database_acl_tags = {}

database_dedicated_network_acl = false

database_inbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

database_outbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

database_route_table_tags = {}

database_subnet_assign_ipv6_address_on_creation = false

database_subnet_enable_dns64 = true

database_subnet_enable_resource_name_dns_a_record_on_launch = false

database_subnet_enable_resource_name_dns_aaaa_record_on_launch = true

database_subnet_group_name = null

database_subnet_group_tags = {}

database_subnet_ipv6_native = false

database_subnet_ipv6_prefixes = []

database_subnet_names = []

database_subnet_private_dns_hostname_type_on_launch = null

database_subnet_suffix = "db"

database_subnet_tags = {}

database_subnets = []

default_network_acl_egress = [
  {
    "action" : "allow",
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_no" : 100,
    "to_port" : 0
  },
  {
    "action" : "allow",
    "from_port" : 0,
    "ipv6_cidr_block" : "::/0",
    "protocol" : "-1",
    "rule_no" : 101,
    "to_port" : 0
  }
]

default_network_acl_ingress = [
  {
    "action" : "allow",
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_no" : 100,
    "to_port" : 0
  },
  {
    "action" : "allow",
    "from_port" : 0,
    "ipv6_cidr_block" : "::/0",
    "protocol" : "-1",
    "rule_no" : 101,
    "to_port" : 0
  }
]

default_network_acl_name = null

default_network_acl_tags = {}

default_route_table_name = null

default_route_table_propagating_vgws = []

default_route_table_routes = []

default_route_table_tags = {}

default_security_group_egress = []

default_security_group_ingress = []

default_security_group_name = null

default_security_group_tags = {}

default_vpc_enable_dns_hostnames = true

default_vpc_enable_dns_support = true

default_vpc_name = null

default_vpc_tags = {}

dhcp_options_domain_name = ""

dhcp_options_domain_name_servers = [
  "AmazonProvidedDNS"
]

dhcp_options_netbios_name_servers = []

dhcp_options_netbios_node_type = ""

dhcp_options_ntp_servers = []

dhcp_options_tags = {}

elasticache_acl_tags = {}

elasticache_dedicated_network_acl = false

elasticache_inbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

elasticache_outbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

elasticache_route_table_tags = {}

elasticache_subnet_assign_ipv6_address_on_creation = false

elasticache_subnet_enable_dns64 = true

elasticache_subnet_enable_resource_name_dns_a_record_on_launch = false

elasticache_subnet_enable_resource_name_dns_aaaa_record_on_launch = true

elasticache_subnet_group_name = null

elasticache_subnet_group_tags = {}

elasticache_subnet_ipv6_native = false

elasticache_subnet_ipv6_prefixes = []

elasticache_subnet_names = []

elasticache_subnet_private_dns_hostname_type_on_launch = null

elasticache_subnet_suffix = "elasticache"

elasticache_subnet_tags = {}

elasticache_subnets = []

enable_dhcp_options = false

enable_dns_hostnames = true

enable_dns_support = true

enable_flow_log = false

enable_ipv6 = false

enable_nat_gateway = false

enable_network_address_usage_metrics = null

enable_public_redshift = false

enable_vpn_gateway = false

external_nat_ip_ids = []

external_nat_ips = []

flow_log_cloudwatch_iam_role_arn = ""

flow_log_cloudwatch_log_group_class = null

flow_log_cloudwatch_log_group_kms_key_id = null

flow_log_cloudwatch_log_group_name_prefix = "/aws/vpc-flow-log/"

flow_log_cloudwatch_log_group_name_suffix = ""

flow_log_cloudwatch_log_group_retention_in_days = null

flow_log_cloudwatch_log_group_skip_destroy = false

flow_log_deliver_cross_account_role = null

flow_log_destination_arn = ""

flow_log_destination_type = "cloud-watch-logs"

flow_log_file_format = null

flow_log_hive_compatible_partitions = false

flow_log_log_format = null

flow_log_max_aggregation_interval = 600

flow_log_per_hour_partition = false

flow_log_traffic_type = "ALL"

igw_tags = {}

instance_tenancy = "default"

intra_acl_tags = {}

intra_dedicated_network_acl = false

intra_inbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

intra_outbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

intra_route_table_tags = {}

intra_subnet_assign_ipv6_address_on_creation = false

intra_subnet_enable_dns64 = true

intra_subnet_enable_resource_name_dns_a_record_on_launch = false

intra_subnet_enable_resource_name_dns_aaaa_record_on_launch = true

intra_subnet_ipv6_native = false

intra_subnet_ipv6_prefixes = []

intra_subnet_names = []

intra_subnet_private_dns_hostname_type_on_launch = null

intra_subnet_suffix = "intra"

intra_subnet_tags = {}

intra_subnets = []

ipv4_ipam_pool_id = null

ipv4_netmask_length = null

ipv6_cidr = null

ipv6_cidr_block_network_border_group = null

ipv6_ipam_pool_id = null

ipv6_netmask_length = null

manage_default_network_acl = true

manage_default_route_table = true

manage_default_security_group = true

manage_default_vpc = false

map_customer_owned_ip_on_launch = false

map_public_ip_on_launch = false

name = ""

nat_eip_tags = {}

nat_gateway_destination_cidr_block = "0.0.0.0/0"

nat_gateway_tags = {}

one_nat_gateway_per_az = false

outpost_acl_tags = {}

outpost_arn = null

outpost_az = null

outpost_dedicated_network_acl = false

outpost_inbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

outpost_outbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

outpost_subnet_assign_ipv6_address_on_creation = false

outpost_subnet_enable_dns64 = true

outpost_subnet_enable_resource_name_dns_a_record_on_launch = false

outpost_subnet_enable_resource_name_dns_aaaa_record_on_launch = true

outpost_subnet_ipv6_native = false

outpost_subnet_ipv6_prefixes = []

outpost_subnet_names = []

outpost_subnet_private_dns_hostname_type_on_launch = null

outpost_subnet_suffix = "outpost"

outpost_subnet_tags = {}

outpost_subnets = []

private_acl_tags = {}

private_dedicated_network_acl = false

private_inbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

private_outbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

private_route_table_tags = {}

private_subnet_assign_ipv6_address_on_creation = false

private_subnet_enable_dns64 = true

private_subnet_enable_resource_name_dns_a_record_on_launch = false

private_subnet_enable_resource_name_dns_aaaa_record_on_launch = true

private_subnet_ipv6_native = false

private_subnet_ipv6_prefixes = []

private_subnet_names = []

private_subnet_private_dns_hostname_type_on_launch = null

private_subnet_suffix = "private"

private_subnet_tags = {}

private_subnet_tags_per_az = {}

private_subnets = []

propagate_intra_route_tables_vgw = false

propagate_private_route_tables_vgw = false

propagate_public_route_tables_vgw = false

public_acl_tags = {}

public_dedicated_network_acl = false

public_inbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

public_outbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

public_route_table_tags = {}

public_subnet_assign_ipv6_address_on_creation = false

public_subnet_enable_dns64 = true

public_subnet_enable_resource_name_dns_a_record_on_launch = false

public_subnet_enable_resource_name_dns_aaaa_record_on_launch = true

public_subnet_ipv6_native = false

public_subnet_ipv6_prefixes = []

public_subnet_names = []

public_subnet_private_dns_hostname_type_on_launch = null

public_subnet_suffix = "public"

public_subnet_tags = {}

public_subnet_tags_per_az = {}

public_subnets = []

putin_khuylo = true

redshift_acl_tags = {}

redshift_dedicated_network_acl = false

redshift_inbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

redshift_outbound_acl_rules = [
  {
    "cidr_block" : "0.0.0.0/0",
    "from_port" : 0,
    "protocol" : "-1",
    "rule_action" : "allow",
    "rule_number" : 100,
    "to_port" : 0
  }
]

redshift_route_table_tags = {}

redshift_subnet_assign_ipv6_address_on_creation = false

redshift_subnet_enable_dns64 = true

redshift_subnet_enable_resource_name_dns_a_record_on_launch = false

redshift_subnet_enable_resource_name_dns_aaaa_record_on_launch = true

redshift_subnet_group_name = null

redshift_subnet_group_tags = {}

redshift_subnet_ipv6_native = false

redshift_subnet_ipv6_prefixes = []

redshift_subnet_names = []

redshift_subnet_private_dns_hostname_type_on_launch = null

redshift_subnet_suffix = "redshift"

redshift_subnet_tags = {}

redshift_subnets = []

reuse_nat_ips = false

secondary_cidr_blocks = []

single_nat_gateway = false

tags = {}

use_ipam_pool = false

vpc_flow_log_permissions_boundary = null

vpc_flow_log_tags = {}

vpc_tags = {}

vpn_gateway_az = null

vpn_gateway_id = ""

vpn_gateway_tags = {}
