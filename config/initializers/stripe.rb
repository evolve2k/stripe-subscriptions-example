# It's usually a code smell to put environment variables here. Use something like figaro in production.

Rails.configuration.stripe = {
  :publishable_key => 'pk_test_cbgNWVuS134Fwi7ezWsyREGl',
  :secret_key      => '33f21d57-eda6-477f-bfd0-090decad3388'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]