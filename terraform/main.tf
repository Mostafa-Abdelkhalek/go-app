module "network" {
    source = "./network"
    region = var.region
    public_subnet_cidr_1 = var.public_subnet_cidr_1
    private_subnet_cidr_2 = var.private_subnet_cidr_2
    mtu = var.mtu
    project = var.project
}