variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "network_name" {
  type    = string
  default = "jenkins-tf-network"
}
