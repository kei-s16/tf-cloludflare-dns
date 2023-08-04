# CNAME Records
resource "cloudflare_record" "blog" {
  zone_id         = var.cloudflare_zone_id
  name            = "blog"
  comment         = "blog on Vercel"
  type            = "CNAME"
  value           = "cname.vercel-dns.com."
  proxied         = false
  allow_overwrite = false
}

resource "cloudflare_record" "apex" {
  zone_id         = var.cloudflare_zone_id
  name            = "k16em.net"
  comment         = "LP on Cloudflare Pages / using CNAME flattening"
  type            = "CNAME"
  value           = "k16em-net.pages.dev"
  proxied         = true
  allow_overwrite = false
}

resource "cloudflare_record" "www" {
  zone_id         = var.cloudflare_zone_id
  name            = "www"
  comment         = "LP on Cloudflare Pages"
  type            = "CNAME"
  value           = "k16em-net.pages.dev"
  proxied         = true
  allow_overwrite = false
}

# TXT Records
resource "cloudflare_record" "atproto" {
  zone_id         = var.cloudflare_zone_id
  name            = "_atproto"
  comment         = "for bluesky"
  type            = "TXT"
  value           = "did=did:plc:h3q4yrpualkpqes2zjn5xtbi"
  allow_overwrite = false
}

resource "cloudflare_record" "atproto-bot" {
  zone_id         = var.cloudflare_zone_id
  name            = "_atproto.sandbox"
  comment         = "for bluesky bot"
  type            = "TXT"
  value           = "did=did:plc:grwbsccbvjgbf7w5zefiaa23"
  allow_overwrite = false
}

resource "cloudflare_record" "keybase-apex" {
  zone_id         = var.cloudflare_zone_id
  name            = "k16em.net"
  comment         = "for keybase"
  type            = "TXT"
  value           = "keybase-site-verification=tpgM8Hmp9bkePa9j-qMD7G_Hy1KoCkpEgPi_OQVqzW8"
  allow_overwrite = false
}

resource "cloudflare_record" "keybase-blog" {
  zone_id         = var.cloudflare_zone_id
  name            = "blog"
  comment         = "for keybase"
  type            = "TXT"
  value           = "keybase-site-verification=udbQAxp-I1L3AHezcTnOAXhSPpq_CbLz1P9KCj9lkfo"
  allow_overwrite = false
}

resource "cloudflare_record" "txt-localhost" {
  zone_id         = var.cloudflare_zone_id
  name            = "localhost"
  type            = "TXT"
  value           = "This DNS Record points to your localhost."
  allow_overwrite = false
}

# A Records
resource "cloudflare_record" "a-localhost" {
  zone_id         = var.cloudflare_zone_id
  name            = "localhost"
  comment         = "for local development env"
  type            = "A"
  value           = "127.0.0.1"
  proxied         = false
  allow_overwrite = false
}
