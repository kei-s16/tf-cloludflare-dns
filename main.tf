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
      version = "~> 4.9.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
