variable "credentials_file" {
  description = "Path to the GCP service account key JSON file"
  #default     = "C:/terraform_1.5.1_windows_386/keyfile.json"
  #type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  #default     = "artful-bonsai-390717"
}

variable "region" {
  description = "GCP Region"
  default     = "us-east1"
}

variable "zone" {
  description = "GCP Zone"
  default     = "us-east1-b"
}

variable "network_name" {
  description = "NAme of network"
  default="mynetwork"
}

variable "subnetwork_name"{
  description = "Name of subnetwork"
  default = "mysubnetwork"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnetwork"
  default     = "10.0.0.0/24"
}

variable "firewall_name" {
  description = "Name of the firewall"
  default     = "my-firewall"
}