variable "CI_ENVIRONMENT_NAME" {
  type        = string
  description = "Project Environment (Required)"
  default     = "dev"
}

variable "amazon_side_asn" {
  type        = string
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN"
  default     = "64512"
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region"
  default     = []
}

variable "cidr" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  default     = "10.0.0.0/16"
}

variable "create_database_internet_gateway_route" {
  type        = bool
  description = "Controls if an internet gateway route for public database access should be created"
  default     = false
}

variable "create_database_nat_gateway_route" {
  type        = bool
  description = "Controls if a nat gateway route should be created to give internet access to the database subnets"
  default     = false
}

variable "create_database_subnet_group" {
  type        = bool
  description = "Controls if database subnet group should be created (n.b. database_subnets must also be set)"
  default     = true
}

variable "create_database_subnet_route_table" {
  type        = bool
  description = "Controls if separate route table for database should be created"
  default     = false
}

variable "create_egress_only_igw" {
  type        = bool
  description = "Controls if an Egress Only Internet Gateway is created and its related routes"
  default     = true
}

variable "create_elasticache_subnet_group" {
  type        = bool
  description = "Controls if elasticache subnet group should be created"
  default     = true
}

variable "create_elasticache_subnet_route_table" {
  type        = bool
  description = "Controls if separate route table for elasticache should be created"
  default     = false
}

variable "create_flow_log_cloudwatch_iam_role" {
  type        = bool
  description = "Whether to create IAM role for VPC Flow Logs"
  default     = false
}

variable "create_flow_log_cloudwatch_log_group" {
  type        = bool
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  default     = false
}

variable "create_igw" {
  type        = bool
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
  default     = true
}

variable "create_redshift_subnet_group" {
  type        = bool
  description = "Controls if redshift subnet group should be created"
  default     = true
}

variable "create_redshift_subnet_route_table" {
  type        = bool
  description = "Controls if separate route table for redshift should be created"
  default     = false
}

variable "create_vpc" {
  type        = bool
  description = "Controls if VPC should be created (it affects almost all resources)"
  default     = true
}

variable "customer_gateway_tags" {
  type        = map(string)
  description = "Additional tags for the Customer Gateway"
  default     = {}
}

variable "customer_gateways" {
  type        = map(map(any))
  description = "Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address)"
  default     = {}
}

variable "customer_owned_ipv4_pool" {
  type        = string
  description = "The customer owned IPv4 address pool. Typically used with the `map_customer_owned_ip_on_launch` argument. The `outpost_arn` argument must be specified when configured"
  default     = null
}

variable "database_acl_tags" {
  type        = map(string)
  description = "Additional tags for the database subnets network ACL"
  default     = {}
}

variable "database_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for database subnets"
  default     = false
}

variable "database_inbound_acl_rules" {
  type        = list(map(string))
  description = "Database subnets inbound network ACL rules"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "database_outbound_acl_rules" {
  type        = list(map(string))
  description = "Database subnets outbound network ACL rules"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "database_route_table_tags" {
  type        = map(string)
  description = "Additional tags for the database route tables"
  default     = {}
}

variable "database_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  default     = false
}

variable "database_subnet_enable_dns64" {
  type        = bool
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  default     = true
}

variable "database_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  default     = false
}

variable "database_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  default     = true
}

variable "database_subnet_group_name" {
  type        = string
  description = "Name of database subnet group"
  default     = null
}

variable "database_subnet_group_tags" {
  type        = map(string)
  description = "Additional tags for the database subnet group"
  default     = {}
}

variable "database_subnet_ipv6_native" {
  type        = bool
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  default     = false
}

variable "database_subnet_ipv6_prefixes" {
  type        = list(string)
  description = "Assigns IPv6 database subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  default     = []
}

variable "database_subnet_names" {
  type        = list(string)
  description = "Explicit values to use in the Name tag on database subnets. If empty, Name tags are generated"
  default     = []
}

variable "database_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  default     = null
}

variable "database_subnet_suffix" {
  type        = string
  description = "Suffix to append to database subnets name"
  default     = "db"
}

variable "database_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the database subnets"
  default     = {}
}

variable "database_subnets" {
  type        = list(string)
  description = "A list of database subnets inside the VPC"
  default     = []
}

variable "default_network_acl_egress" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the Default Network ACL"
  default = [
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
}

variable "default_network_acl_ingress" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the Default Network ACL"
  default = [
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
}

variable "default_network_acl_name" {
  type        = string
  description = "Name to be used on the Default Network ACL"
  default     = null
}

variable "default_network_acl_tags" {
  type        = map(string)
  description = "Additional tags for the Default Network ACL"
  default     = {}
}

variable "default_route_table_name" {
  type        = string
  description = "Name to be used on the default route table"
  default     = null
}

variable "default_route_table_propagating_vgws" {
  type        = list(string)
  description = "List of virtual gateways for propagation"
  default     = []
}

variable "default_route_table_routes" {
  type        = list(map(string))
  description = "Configuration block of routes. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table#route"
  default     = []
}

variable "default_route_table_tags" {
  type        = map(string)
  description = "Additional tags for the default route table"
  default     = {}
}

variable "default_security_group_egress" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the default security group"
  default     = []
}

variable "default_security_group_ingress" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the default security group"
  default     = []
}

variable "default_security_group_name" {
  type        = string
  description = "Name to be used on the default security group"
  default     = null
}

variable "default_security_group_tags" {
  type        = map(string)
  description = "Additional tags for the default security group"
  default     = {}
}

variable "default_vpc_enable_dns_hostnames" {
  type        = bool
  description = "Should be true to enable DNS hostnames in the Default VPC"
  default     = true
}

variable "default_vpc_enable_dns_support" {
  type        = bool
  description = "Should be true to enable DNS support in the Default VPC"
  default     = true
}

variable "default_vpc_name" {
  type        = string
  description = "Name to be used on the Default VPC"
  default     = null
}

variable "default_vpc_tags" {
  type        = map(string)
  description = "Additional tags for the Default VPC"
  default     = {}
}

variable "dhcp_options_domain_name" {
  type        = string
  description = "Specifies DNS name for DHCP options set (requires enable_dhcp_options set to true)"
  default     = ""
}

variable "dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable_dhcp_options set to true)"
  default = [
    "AmazonProvidedDNS"
  ]
}

variable "dhcp_options_netbios_name_servers" {
  type        = list(string)
  description = "Specify a list of netbios servers for DHCP options set (requires enable_dhcp_options set to true)"
  default     = []
}

variable "dhcp_options_netbios_node_type" {
  type        = string
  description = "Specify netbios node_type for DHCP options set (requires enable_dhcp_options set to true)"
  default     = ""
}

variable "dhcp_options_ntp_servers" {
  type        = list(string)
  description = "Specify a list of NTP servers for DHCP options set (requires enable_dhcp_options set to true)"
  default     = []
}

variable "dhcp_options_tags" {
  type        = map(string)
  description = "Additional tags for the DHCP option set (requires enable_dhcp_options set to true)"
  default     = {}
}

variable "elasticache_acl_tags" {
  type        = map(string)
  description = "Additional tags for the elasticache subnets network ACL"
  default     = {}
}

variable "elasticache_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for elasticache subnets"
  default     = false
}

variable "elasticache_inbound_acl_rules" {
  type        = list(map(string))
  description = "Elasticache subnets inbound network ACL rules"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "elasticache_outbound_acl_rules" {
  type        = list(map(string))
  description = "Elasticache subnets outbound network ACL rules"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "elasticache_route_table_tags" {
  type        = map(string)
  description = "Additional tags for the elasticache route tables"
  default     = {}
}

variable "elasticache_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  default     = false
}

variable "elasticache_subnet_enable_dns64" {
  type        = bool
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  default     = true
}

variable "elasticache_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  default     = false
}

variable "elasticache_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  default     = true
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Name of elasticache subnet group"
  default     = null
}

variable "elasticache_subnet_group_tags" {
  type        = map(string)
  description = "Additional tags for the elasticache subnet group"
  default     = {}
}

variable "elasticache_subnet_ipv6_native" {
  type        = bool
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  default     = false
}

variable "elasticache_subnet_ipv6_prefixes" {
  type        = list(string)
  description = "Assigns IPv6 elasticache subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  default     = []
}

variable "elasticache_subnet_names" {
  type        = list(string)
  description = "Explicit values to use in the Name tag on elasticache subnets. If empty, Name tags are generated"
  default     = []
}

variable "elasticache_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  default     = null
}

variable "elasticache_subnet_suffix" {
  type        = string
  description = "Suffix to append to elasticache subnets name"
  default     = "elasticache"
}

variable "elasticache_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the elasticache subnets"
  default     = {}
}

variable "elasticache_subnets" {
  type        = list(string)
  description = "A list of elasticache subnets inside the VPC"
  default     = []
}

variable "enable_dhcp_options" {
  type        = bool
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  default     = false
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "enable_flow_log" {
  type        = bool
  description = "Whether or not to enable VPC Flow Logs"
  default     = false
}

variable "enable_ipv6" {
  type        = bool
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block"
  default     = false
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}

variable "enable_network_address_usage_metrics" {
  type        = bool
  description = "Determines whether network address usage metrics are enabled for the VPC"
  default     = null
}

variable "enable_public_redshift" {
  type        = bool
  description = "Controls if redshift should have public routing table"
  default     = false
}

variable "enable_vpn_gateway" {
  type        = bool
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "external_nat_ip_ids" {
  type        = list(string)
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  default     = []
}

variable "external_nat_ips" {
  type        = list(string)
  description = "List of EIPs to be used for `nat_public_ips` output (used in combination with reuse_nat_ips and external_nat_ip_ids)"
  default     = []
}

variable "flow_log_cloudwatch_iam_role_arn" {
  type        = string
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow_log_destination_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided"
  default     = ""
}

variable "flow_log_cloudwatch_log_group_class" {
  type        = string
  description = "Specified the log class of the log group. Possible values are: STANDARD or INFREQUENT_ACCESS"
  default     = null
}

variable "flow_log_cloudwatch_log_group_kms_key_id" {
  type        = string
  description = "The ARN of the KMS Key to use when encrypting log data for VPC flow logs"
  default     = null
}

variable "flow_log_cloudwatch_log_group_name_prefix" {
  type        = string
  description = "Specifies the name prefix of CloudWatch Log Group for VPC flow logs"
  default     = "/aws/vpc-flow-log/"
}

variable "flow_log_cloudwatch_log_group_name_suffix" {
  type        = string
  description = "Specifies the name suffix of CloudWatch Log Group for VPC flow logs"
  default     = ""
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  type        = number
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs"
  default     = null
}

variable "flow_log_cloudwatch_log_group_skip_destroy" {
  type        = bool
  description = " Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state"
  default     = false
}

variable "flow_log_deliver_cross_account_role" {
  type        = string
  description = "(Optional) ARN of the IAM role that allows Amazon EC2 to publish flow logs across accounts."
  default     = null
}

variable "flow_log_destination_arn" {
  type        = string
  description = "The ARN of the CloudWatch log group or S3 bucket where VPC Flow Logs will be pushed. If this ARN is a S3 bucket the appropriate permissions need to be set on that bucket's policy. When create_flow_log_cloudwatch_log_group is set to false this argument must be provided"
  default     = ""
}

variable "flow_log_destination_type" {
  type        = string
  description = "Type of flow log destination. Can be s3, kinesis-data-firehose or cloud-watch-logs"
  default     = "cloud-watch-logs"
}

variable "flow_log_file_format" {
  type        = string
  description = "(Optional) The format for the flow log. Valid values: `plain-text`, `parquet`"
  default     = null
}

variable "flow_log_hive_compatible_partitions" {
  type        = bool
  description = "(Optional) Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3"
  default     = false
}

variable "flow_log_log_format" {
  type        = string
  description = "The fields to include in the flow log record, in the order in which they should appear"
  default     = null
}

variable "flow_log_max_aggregation_interval" {
  type        = number
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds"
  default     = 600
}

variable "flow_log_per_hour_partition" {
  type        = bool
  description = "(Optional) Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries"
  default     = false
}

variable "flow_log_traffic_type" {
  type        = string
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL"
  default     = "ALL"
}

variable "igw_tags" {
  type        = map(string)
  description = "Additional tags for the internet gateway"
  default     = {}
}

variable "instance_tenancy" {
  type        = string
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "intra_acl_tags" {
  type        = map(string)
  description = "Additional tags for the intra subnets network ACL"
  default     = {}
}

variable "intra_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for intra subnets"
  default     = false
}

variable "intra_inbound_acl_rules" {
  type        = list(map(string))
  description = "Intra subnets inbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "intra_outbound_acl_rules" {
  type        = list(map(string))
  description = "Intra subnets outbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "intra_route_table_tags" {
  type        = map(string)
  description = "Additional tags for the intra route tables"
  default     = {}
}

variable "intra_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  default     = false
}

variable "intra_subnet_enable_dns64" {
  type        = bool
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  default     = true
}

variable "intra_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  default     = false
}

variable "intra_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  default     = true
}

variable "intra_subnet_ipv6_native" {
  type        = bool
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  default     = false
}

variable "intra_subnet_ipv6_prefixes" {
  type        = list(string)
  description = "Assigns IPv6 intra subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  default     = []
}

variable "intra_subnet_names" {
  type        = list(string)
  description = "Explicit values to use in the Name tag on intra subnets. If empty, Name tags are generated"
  default     = []
}

variable "intra_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  default     = null
}

variable "intra_subnet_suffix" {
  type        = string
  description = "Suffix to append to intra subnets name"
  default     = "intra"
}

variable "intra_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the intra subnets"
  default     = {}
}

variable "intra_subnets" {
  type        = list(string)
  description = "A list of intra subnets inside the VPC"
  default     = []
}

variable "ipv4_ipam_pool_id" {
  type        = string
  description = "(Optional) The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR"
  default     = null
}

variable "ipv4_netmask_length" {
  type        = number
  description = "(Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  default     = null
}

variable "ipv6_cidr" {
  type        = string
  description = "(Optional) IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using `ipv6_netmask_length`"
  default     = null
}

variable "ipv6_cidr_block_network_border_group" {
  type        = string
  description = "By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones"
  default     = null
}

variable "ipv6_ipam_pool_id" {
  type        = string
  description = "(Optional) IPAM Pool ID for a IPv6 pool. Conflicts with `assign_generated_ipv6_cidr_block`"
  default     = null
}

variable "ipv6_netmask_length" {
  type        = number
  description = "(Optional) Netmask length to request from IPAM Pool. Conflicts with `ipv6_cidr_block`. This can be omitted if IPAM pool as a `allocation_default_netmask_length` set. Valid values: `56`"
  default     = null
}

variable "manage_default_network_acl" {
  type        = bool
  description = "Should be true to adopt and manage Default Network ACL"
  default     = true
}

variable "manage_default_route_table" {
  type        = bool
  description = "Should be true to manage default route table"
  default     = true
}

variable "manage_default_security_group" {
  type        = bool
  description = "Should be true to adopt and manage default security group"
  default     = true
}

variable "manage_default_vpc" {
  type        = bool
  description = "Should be true to adopt and manage Default VPC"
  default     = false
}

variable "map_customer_owned_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The `customer_owned_ipv4_pool` and `outpost_arn` arguments must be specified when set to `true`. Default is `false`"
  default     = false
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  default     = false
}

variable "name" {
  type        = string
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "nat_eip_tags" {
  type        = map(string)
  description = "Additional tags for the NAT EIP"
  default     = {}
}

variable "nat_gateway_destination_cidr_block" {
  type        = string
  description = "Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route"
  default     = "0.0.0.0/0"
}

variable "nat_gateway_tags" {
  type        = map(string)
  description = "Additional tags for the NAT gateways"
  default     = {}
}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`"
  default     = false
}

variable "outpost_acl_tags" {
  type        = map(string)
  description = "Additional tags for the outpost subnets network ACL"
  default     = {}
}

variable "outpost_arn" {
  type        = string
  description = "ARN of Outpost you want to create a subnet in"
  default     = null
}

variable "outpost_az" {
  type        = string
  description = "AZ where Outpost is anchored"
  default     = null
}

variable "outpost_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for outpost subnets"
  default     = false
}

variable "outpost_inbound_acl_rules" {
  type        = list(map(string))
  description = "Outpost subnets inbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "outpost_outbound_acl_rules" {
  type        = list(map(string))
  description = "Outpost subnets outbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "outpost_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  default     = false
}

variable "outpost_subnet_enable_dns64" {
  type        = bool
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  default     = true
}

variable "outpost_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  default     = false
}

variable "outpost_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  default     = true
}

variable "outpost_subnet_ipv6_native" {
  type        = bool
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  default     = false
}

variable "outpost_subnet_ipv6_prefixes" {
  type        = list(string)
  description = "Assigns IPv6 outpost subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  default     = []
}

variable "outpost_subnet_names" {
  type        = list(string)
  description = "Explicit values to use in the Name tag on outpost subnets. If empty, Name tags are generated"
  default     = []
}

variable "outpost_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  default     = null
}

variable "outpost_subnet_suffix" {
  type        = string
  description = "Suffix to append to outpost subnets name"
  default     = "outpost"
}

variable "outpost_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the outpost subnets"
  default     = {}
}

variable "outpost_subnets" {
  type        = list(string)
  description = "A list of outpost subnets inside the VPC"
  default     = []
}

variable "private_acl_tags" {
  type        = map(string)
  description = "Additional tags for the private subnets network ACL"
  default     = {}
}

variable "private_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for private subnets"
  default     = false
}

variable "private_inbound_acl_rules" {
  type        = list(map(string))
  description = "Private subnets inbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "private_outbound_acl_rules" {
  type        = list(map(string))
  description = "Private subnets outbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "private_route_table_tags" {
  type        = map(string)
  description = "Additional tags for the private route tables"
  default     = {}
}

variable "private_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  default     = false
}

variable "private_subnet_enable_dns64" {
  type        = bool
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  default     = true
}

variable "private_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  default     = false
}

variable "private_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  default     = true
}

variable "private_subnet_ipv6_native" {
  type        = bool
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  default     = false
}

variable "private_subnet_ipv6_prefixes" {
  type        = list(string)
  description = "Assigns IPv6 private subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  default     = []
}

variable "private_subnet_names" {
  type        = list(string)
  description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated"
  default     = []
}

variable "private_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  default     = null
}

variable "private_subnet_suffix" {
  type        = string
  description = "Suffix to append to private subnets name"
  default     = "private"
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the private subnets"
  default     = {}
}

variable "private_subnet_tags_per_az" {
  type        = map(map(string))
  description = "Additional tags for the private subnets where the primary key is the AZ"
  default     = {}
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC"
  default     = []
}

variable "propagate_intra_route_tables_vgw" {
  type        = bool
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "propagate_private_route_tables_vgw" {
  type        = bool
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "propagate_public_route_tables_vgw" {
  type        = bool
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "public_acl_tags" {
  type        = map(string)
  description = "Additional tags for the public subnets network ACL"
  default     = {}
}

variable "public_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for public subnets"
  default     = false
}

variable "public_inbound_acl_rules" {
  type        = list(map(string))
  description = "Public subnets inbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "public_outbound_acl_rules" {
  type        = list(map(string))
  description = "Public subnets outbound network ACLs"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "public_route_table_tags" {
  type        = map(string)
  description = "Additional tags for the public route tables"
  default     = {}
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  default     = false
}

variable "public_subnet_enable_dns64" {
  type        = bool
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  default     = true
}

variable "public_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  default     = false
}

variable "public_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  default     = true
}

variable "public_subnet_ipv6_native" {
  type        = bool
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  default     = false
}

variable "public_subnet_ipv6_prefixes" {
  type        = list(string)
  description = "Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  default     = []
}

variable "public_subnet_names" {
  type        = list(string)
  description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated"
  default     = []
}

variable "public_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  default     = null
}

variable "public_subnet_suffix" {
  type        = string
  description = "Suffix to append to public subnets name"
  default     = "public"
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "public_subnet_tags_per_az" {
  type        = map(map(string))
  description = "Additional tags for the public subnets where the primary key is the AZ"
  default     = {}
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
  default     = []
}

variable "redshift_acl_tags" {
  type        = map(string)
  description = "Additional tags for the redshift subnets network ACL"
  default     = {}
}

variable "redshift_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for redshift subnets"
  default     = false
}

variable "redshift_inbound_acl_rules" {
  type        = list(map(string))
  description = "Redshift subnets inbound network ACL rules"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "redshift_outbound_acl_rules" {
  type        = list(map(string))
  description = "Redshift subnets outbound network ACL rules"
  default = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
}

variable "redshift_route_table_tags" {
  type        = map(string)
  description = "Additional tags for the redshift route tables"
  default     = {}
}

variable "redshift_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  default     = false
}

variable "redshift_subnet_enable_dns64" {
  type        = bool
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  default     = true
}

variable "redshift_subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  default     = false
}

variable "redshift_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  default     = true
}

variable "redshift_subnet_group_name" {
  type        = string
  description = "Name of redshift subnet group"
  default     = null
}

variable "redshift_subnet_group_tags" {
  type        = map(string)
  description = "Additional tags for the redshift subnet group"
  default     = {}
}

variable "redshift_subnet_ipv6_native" {
  type        = bool
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  default     = false
}

variable "redshift_subnet_ipv6_prefixes" {
  type        = list(string)
  description = "Assigns IPv6 redshift subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  default     = []
}

variable "redshift_subnet_names" {
  type        = list(string)
  description = "Explicit values to use in the Name tag on redshift subnets. If empty, Name tags are generated"
  default     = []
}

variable "redshift_subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  default     = null
}

variable "redshift_subnet_suffix" {
  type        = string
  description = "Suffix to append to redshift subnets name"
  default     = "redshift"
}

variable "redshift_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the redshift subnets"
  default     = {}
}

variable "redshift_subnets" {
  type        = list(string)
  description = "A list of redshift subnets inside the VPC"
  default     = []
}

variable "reuse_nat_ips" {
  type        = bool
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  default     = false
}

variable "secondary_cidr_blocks" {
  type        = list(string)
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  default     = []
}

variable "single_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "use_ipam_pool" {
  type        = bool
  description = "Determines whether IPAM pool is used for CIDR allocation"
  default     = false
}

variable "vpc_flow_log_permissions_boundary" {
  type        = string
  description = "The ARN of the Permissions Boundary for the VPC Flow Log IAM Role"
  default     = null
}

variable "vpc_flow_log_tags" {
  type        = map(string)
  description = "Additional tags for the VPC Flow Logs"
  default     = {}
}

variable "vpc_tags" {
  type        = map(string)
  description = "Additional tags for the VPC"
  default     = {}
}

variable "vpn_gateway_az" {
  type        = string
  description = "The Availability Zone for the VPN Gateway"
  default     = null
}

variable "vpn_gateway_id" {
  type        = string
  description = "ID of VPN Gateway to attach to the VPC"
  default     = ""
}

variable "vpn_gateway_tags" {
  type        = map(string)
  description = "Additional tags for the VPN gateway"
  default     = {}
}
