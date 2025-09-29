resource "aws_instance" "example" {
  ami           = local.AMI_ID
  instance_type = var.KKE_INSTANCE_TYPE
  count         = var.KKE_INSTANCE_COUNT
  key_name      = var.KKE_KEY_NAME

  tags = {
    Name = "${var.KKE_INSTANCE_PREFIX}-${count.index + 1}"
  }
}