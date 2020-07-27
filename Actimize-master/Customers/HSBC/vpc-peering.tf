data "terraform_remote_state" "AdminVPC" {
  backend = "s3"
  config = {
    bucket = "terraform-state-bucket-demo"
    key    = "AdminVPC.tfstate"
    region = "eu-west-2"
  }
}

resource "aws_vpc_peering_connection" "admin_customer" {
  peer_vpc_id   = "${aws_vpc.admin_vpc.id}"
  vpc_id        = data.terraform_remote_state.AdminVPC.vpc_id
  auto_accept   = true

  tags = {
    actimize = "actimize"
  }
}
