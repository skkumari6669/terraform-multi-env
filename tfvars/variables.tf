variable "instances" {
   type = map

}

 variable "tags" {
  
 }

variable "common_tags" {
    default = {
    project = "expense"
    terraform ="true" 
    }
}

variable "domain_name" {
    default = "devops81s.online"
}

variable "environment" {
  
}

variable "hosted_zone_id" {
    default = "Z080246022VY26YENWR20"
}