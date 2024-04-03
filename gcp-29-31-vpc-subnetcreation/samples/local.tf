# Output the merged vpc and subnet
locals {
  vpc_block    = module.terraform-gcp-vpc.vpc_block_output
  subnet_block = module.terraform-gcp-subnet.subnet_block_output
}