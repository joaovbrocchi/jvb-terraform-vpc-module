variable "vpc_config" {
  description = "Configuration for the VPC, including CIDR block and name"
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The CIDR block must be a valid IPv4 CIDR range."
  }
}
