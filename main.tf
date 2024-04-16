terraform {
  required_version = ">= 1.3.9"
}

variable "subject" {
  type = string
  default = "World"
  description = "Subject to hello"
}

resource "random_id" "id" {
  keepers = {
    trigger = var.subject
  }

  byte_length = 4
}

resource "random_id" "id2" {
  keepers = {
    trigger = var.subject
  }

  byte_length = 4
}

output "hello_world_2" {
  value = "Hello World, ${var.subject} ${random_id.id2.hex}!"
}

output "hello_world" {
  value = "Hello World, ${var.subject} ${random_id.id.hex}!"
}