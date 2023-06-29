#variable "pm_token" {
#  type = object({
#    id     = string
#    secret = string
#  })
#}

variable "credentials" {
  type = object({
    username = string
    password = string
  })
}
