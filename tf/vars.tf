variable "ssh_key_path" {
  description = "Public SSH keys path to be included in the ~/.ssh/authorized_keys file for the default user on the instance"
  type = object({
    private = string
    public  = string
  })
}

variable "region" {
  description = "Region where to deploy app"
  type        = string
}

variable "project" {
  description = "GCP project name where to deploy app"
  type        = string
}
