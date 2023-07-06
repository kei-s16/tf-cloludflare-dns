resource "cloudflare_zone" "k16em" {
  zone       = "k16em.net"
  account_id = var.cloudflare_account_id
  plan       = "free"
}
