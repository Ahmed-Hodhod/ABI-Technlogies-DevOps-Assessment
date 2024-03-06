provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "backend" {
  source = "./backend"
}

module "frontend" {
  source = "./frontend"
}

module "mysql" {
  source = "./mysql"
}
