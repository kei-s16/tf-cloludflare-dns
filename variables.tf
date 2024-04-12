variable "cloudflare_zone_id" {
  sensitive = true
  type = string
  description = <<EOT
    ドメインのゾーンID

    refs: https://developers.cloudflare.com/fundamentals/setup/find-account-and-zone-ids/
  EOT
}

variable "cloudflare_account_id" {
  sensitive = true
  type = string
  description = <<EOT
    アカウントID

    refs: https://developers.cloudflare.com/fundamentals/setup/find-account-and-zone-ids/
  EOT
}

variable "cloudflare_domain" {
  type = string
  description = "管理するドメイン名"
}
