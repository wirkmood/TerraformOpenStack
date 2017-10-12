######################################################
# Variables for Template
######################################################

variable "OStack-Admin" {
  type    	= "string"
  default 	= "admin"
}

variable "OStack-password" {
  type    	= "string"
  default 	= "PASSWORD"
}

variable "Region" {
 type 		= "string"
 default	= "RegionOne"
}

variable "auth_url" {
 type		= "string"
 default	= "http://yourIP/v2.0"
}

variable "ssh" {
  type 	   	= "string"
  default	= "yourRSAkey"
}

variable "image" {
  type	   	= "string"
  default  	= "yourImage"  

}
  
variable "flavor" {
 type		= "string"
 default	= "yourFlavor"
}

variable "InstanceName" {
 type		= "string"
 default	= "Instance1"
}

variable "external_gateway" {}

variable "pool" {
  default = "public"
}
