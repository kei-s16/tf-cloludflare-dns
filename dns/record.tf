locals {
  a_records = {
    "util.srv"  = { value = "34.120.54.55", comment = "my utility endpoint", proxied = false }
    "localhost" = { value = "127.0.0.1", comment = "for local development env", proxied = false }
  }
  aaaa_records = {
    "util.srv" = { value = "2600:1901:0:6d85::", comment = "my utility endpoint", proxied = false }
  }
  cname_recoreds = {
    "blog"                     = { value = "cname.vercel-dns.com.", comment = "blog on Vercel", proxied = false }
    "k16em.net"                = { value = "k16em-net.pages.dev", comment = "LP on Cloudflare Pages / using CNAME flattening", proxied = true }
    "www"                      = { value = "k16em-net.pages.dev", comment = "LP on Cloudflare Pages", proxied = true }
    "_acme-challenge.util.srv" = { value = "e103dfa20abbcf916c17dcce._acme.deno.dev.", comment = "my utility endpoint", proxied = false }
    "flavor.api.app"           = { value = "omenspeaker.k16em.workers.dev", comment = "", proxied = true }
  }
  txt_records = {
    "_atproto"         = { value = "did=did:plc:h3q4yrpualkpqes2zjn5xtbi", comment = "for bluesky" }
    "_atproto.sandbox" = { value = "did=did:plc:grwbsccbvjgbf7w5zefiaa23", comment = "for bluesky bot" }
    "k16em.net"        = { value = "keybase-site-verification=tpgM8Hmp9bkePa9j-qMD7G_Hy1KoCkpEgPi_OQVqzW8", comment = "for keybase" }
    "blog"             = { value = "keybase-site-verification=udbQAxp-I1L3AHezcTnOAXhSPpq_CbLz1P9KCj9lkfo", comment = "for keybase" }
    "localhost"        = { value = "This DNS Record points to your localhost.", comment = "" }
  }
}

# A Records
resource "cloudflare_record" "a" {
  for_each = local.a_records

  zone_id         = var.cloudflare_zone_id
  name            = each.key
  comment         = each.value.comment
  type            = "A"
  value           = each.value.value
  proxied         = each.value.proxied
  allow_overwrite = false
}

# AAAA Records
resource "cloudflare_record" "aaaa" {
  for_each = local.aaaa_records

  zone_id         = var.cloudflare_zone_id
  name            = each.key
  comment         = each.value.comment
  type            = "AAAA"
  value           = each.value.value
  proxied         = each.value.proxied
  allow_overwrite = false
}

# CNAME Records
resource "cloudflare_record" "cname" {
  for_each = local.cname_recoreds

  zone_id         = var.cloudflare_zone_id
  name            = each.key
  comment         = each.value.comment
  type            = "CNAME"
  value           = each.value.value
  proxied         = each.value.proxied
  allow_overwrite = false
}

# TXT Records
resource "cloudflare_record" "txt" {
  for_each = local.txt_records

  zone_id         = var.cloudflare_zone_id
  name            = each.key
  comment         = each.value.comment
  type            = "TXT"
  value           = each.value.value
  allow_overwrite = false
}

