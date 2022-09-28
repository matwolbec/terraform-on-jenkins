// Environment
variable "locat" {
    default = "eastus"
}

variable "rg" {
    default = "tf-on-jenkins"
}

variable env_tag {
    default = "production"
}


//Computing
variable "kc" {
    default = "aks_cluster"
}