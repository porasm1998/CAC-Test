variable "name" {}
variable "secret_string" {
    default = {
        username = "defaultuser"
        password = "default@123"
    }
    type = map(string)
}