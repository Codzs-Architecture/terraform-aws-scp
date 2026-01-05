variable "workload_ou_id" {
  description = "The Root ID, Organizational Unit ID, or AWS Account ID to apply SCPs."
  type        = string
}

variable "instance_type" {
  description = "Supported instance type for the environment"
  type        = list(string)
}

variable "instance_size" {
  description = "Supported instance size for the environment"
  type        = list(string)
}

variable "imdsv2_max_hop" {
  description = "IMDSv2 protects against misconfigured EC2 instances acting as open routers, firewalls, VPNs, or NAT devices, securing metadata from unauthorized access."
  type        = number
}

variable "application_name" {
  type        = string
  description = "Application name"
}

variable "enforce_for_values" {
  type        = list(string)
  description = "A list of tag values to enforce for the 'Application' tag."
}

variable "tags" {
  type        = map(any)
  description = "Map of tags for repository"
}