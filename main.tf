variable "create_resource" {
  type    = bool
  default = false
}

resource "null_resource" "example" {
  count = var.create_resource ? 1 : 0

  provisioner "local-exec" {
    command = "echo 'Resource created' > example.txt"
  }
}

resource "null_resource" "dependent_example" {
  depends_on = [null_resource.example]

  provisioner "local-exec" {
    command = "echo 'Dependent resource created with create_resource ${var.create_resource}' > dependent_example.txt"
  }

}
