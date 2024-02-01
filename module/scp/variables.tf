variable "workload_ou_id" {
  description = "The Root ID, Organizational Unit ID, or AWS Account ID to apply SCPs."
  type        = string
}

variable "instance_type" {
  description = "Supported instance type for the environment"
  type = list(string)
}

variable "instance_size" {
  description = "Supported instance size for the environment"
  type = list(string)
}

variable "imdsv2_max_hop" {
  description = "IMDSv2 protects against misconfigured EC2 instances acting as open routers, firewalls, VPNs, or NAT devices, securing metadata from unauthorized access."
  type = number
}

variable "name_tag_key" {
  type        = string
  description = "The tag key for the 'Name' tag."
}

variable "environment_tag_key" {
  type        = string
  description = "The tag key for the 'Environment' tag."
}

variable "environment_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Environment' tag."
}

variable "owner_tag_key" {
  type        = string
  description = "The tag key for the 'Owner' tag."
}

variable "owner_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Owner' tag."
}

variable "policy_owner_tag_value" {
  type        = string
  description = "Owner tag value for the SCP/Tag policy."
}

variable "costcenter_tag_key" {
  type        = string
  description = "The tag key for the 'CostCenter' tag."
}

variable "costcenter_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'CostCenter' tag."
}

variable "policy_costcenter_tag_value" {
  type        = string
  description = "Cost center tag value for the SCP/Tag policy."
}

variable "application_tag_key" {
  type        = string
  description = "The tag key for the 'Application' tag."
}

variable "application_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Application' tag."
}

variable "policy_application_tag_value" {
  type        = string
  description = "Application tag value for the SCP/Tag policy."
}

variable "platform_tag_key" {
  type        = string
  description = "The tag key for the 'Platform' tag."
}

variable "platform_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Platform' tag."
}

variable "policy_platform_tag_value" {
  type        = string
  description = "Platform tag value for the SCP/Tag policy."
}

variable "organization_tag_key" {
  type        = string
  description = "The tag key for the 'Organization' tag."
}

variable "organization_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Organization' tag."
}

variable "policy_organization_tag_value" {
  type        = string
  description = "Organization tag value for the SCP/Tag policy."
}

variable "department_tag_key" {
  type        = string
  description = "The tag key for the 'Department' tag."
}

variable "department_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Department' tag."
}

variable "policy_department_tag_value" {
  type        = string
  description = "Department tag value for the SCP/Tag policy."
}

variable "patch_cycle_tag_key" {
  type        = string
  description = "The tag key for the 'Patch Cycle' tag."
}

variable "power_management_tag_key" {
  type        = string
  description = "A list of tag values to enforce for the 'Power Management' tag."
}

variable "power_management_tag_value" {
  type        = list(string)
  description = "A list of valid tag values for the 'Power Management' tag."
}

variable "enforce_for_values" {
  type        = list(string)
  description = "A list of tag values to enforce for the 'Application' tag."
}
