variable "in" {
  type = string
}

output "out" {
  value = "out ${var.in}"
}

