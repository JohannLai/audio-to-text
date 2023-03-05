#!/bin/bash

function check {
  domain=$1

  whois_info=$(whois $domain)

  if [[ $whois_info =~ CN ]] || [[ $whois_info =~ .cn ]]; then
    return 1
  else
    return 0
  fi
}
