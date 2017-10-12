######################################################
# Variables for Template
######################################################

variable "OStack-Admin" {
  type    	= "string"
  default 	= "admin"
}

variable "OStack-password" {
  type    	= "string"
  default 	= "Azer-1234"
}

variable "Region" {
 type 		= "string"
 default	= "RegionOne"
}

variable "auth_url" {
 type		= "string"
 default	= "http://192.168.200.50:5000/v2.0"
}

variable "ssh" {
  type 	   	= "string"
  default	= "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAiLsiUIVydcoV/PJhSCwsbaki1WWZUv+dJaNbrQ6YvHdsATMRiVsq/s27qdJfhVMv1MCm3x3ICX1lVSKwy8F0bQRrTzX8yAojNz5LwekqHgtH3crlN1bnxm2s5w0I5Xr2yxxTmOAjNinz1Hi5G7KSrHNeJgLk8YK6SmCwkPJERMlKuvl/B8WtvkGyo9LzfygUZXgayDJMTyG/j8JKeeje8PkgHGDcUhm09R4dLUZ0rXXK2XxgJroX1k41hAD+4bdh+38h5B16ABdSIyoiRQ/t5/OGEWcYCmfXBceiqzhtSpaOI6ylJFgMui+yaDSqKNxHRPZJjikDpiXHqS0vKnPpLw== rsa-key-20171005"
}

variable "image" {
  type	   	= "string"
  default  	= "debian_9"  

}
  
variable "flavor" {
 type		= "string"
 default	= "m1.tiny"
}

variable "InstanceName" {
 type		= "string"
 default	= "Instance1"
}

variable "external_gateway" {}

variable "pool" {
  default = "public"
}
