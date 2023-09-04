# A Records
resource "cloudflare_record" "a-srv-util" {
  zone_id         = var.cloudflare_zone_id
  name            = "util.srv"
  comment         = "my utility endpoint"
  type            = "A"
  value           = "34.120.54.55"
  proxied         = true
  allow_overwrite = false
}

# AAAA Records
resource "cloudflare_record" "aaaa-srv-util" {
  zone_id         = var.cloudflare_zone_id
  name            = "util.srv"
  comment         = "my utility endpoint"
  type            = "AAAA"
  value           = "2600:1901:0:6d85::"
  proxied         = true
  allow_overwrite = false
}

# CNAME Records
resource "cloudflare_record" "cname-blog" {
  zone_id         = var.cloudflare_zone_id
  name            = "blog"
  comment         = "blog on Vercel"
  type            = "CNAME"
  value           = "cname.vercel-dns.com."
  proxied         = false
  allow_overwrite = false
}

resource "cloudflare_record" "cname-apex" {
  zone_id         = var.cloudflare_zone_id
  name            = "k16em.net"
  comment         = "LP on Cloudflare Pages / using CNAME flattening"
  type            = "CNAME"
  value           = "k16em-net.pages.dev"
  proxied         = true
  allow_overwrite = false
}

resource "cloudflare_record" "cname-www" {
  zone_id         = var.cloudflare_zone_id
  name            = "www"
  comment         = "LP on Cloudflare Pages"
  type            = "CNAME"
  value           = "k16em-net.pages.dev"
  proxied         = true
  allow_overwrite = false
}

resource "cloudflare_record" "cname-srv-util" {
  zone_id         = var.cloudflare_zone_id
  name            = "_acme-challenge.util.srv"
  comment         = "my utility endpoint"
  type            = "CNAME"
  value           = "e103dfa20abbcf916c17dcce._acme.deno.dev."
  proxied         = true
  allow_overwrite = false
}

# TXT Records
resource "cloudflare_record" "txt-atproto" {
  zone_id         = var.cloudflare_zone_id
  name            = "_atproto"
  comment         = "for bluesky"
  type            = "TXT"
  value           = "did=did:plc:h3q4yrpualkpqes2zjn5xtbi"
  allow_overwrite = false
}

resource "cloudflare_record" "txt-atproto-bot" {
  zone_id         = var.cloudflare_zone_id
  name            = "_atproto.sandbox"
  comment         = "for bluesky bot"
  type            = "TXT"
  value           = "did=did:plc:grwbsccbvjgbf7w5zefiaa23"
  allow_overwrite = false
}

resource "cloudflare_record" "txt-keybase-apex" {
  zone_id         = var.cloudflare_zone_id
  name            = "k16em.net"
  comment         = "for keybase"
  type            = "TXT"
  value           = "keybase-site-verification=tpgM8Hmp9bkePa9j-qMD7G_Hy1KoCkpEgPi_OQVqzW8"
  allow_overwrite = false
}

resource "cloudflare_record" "txt-keybase-blog" {
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
