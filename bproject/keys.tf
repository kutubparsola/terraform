resource "aws_key_pair" "serverkey" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}
