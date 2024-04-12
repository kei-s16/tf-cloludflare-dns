terraform {
  cloud {
    organization = "kei-s16"

    workspaces {
      name = "cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.29.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

module "dns" {
  source = "./dns"

  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_zone_id    = var.cloudflare_zone_id
  cloudflare_domain     = var.cloudflare_domain
}
