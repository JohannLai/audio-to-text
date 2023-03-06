#!/bin/bash

function check {
  url=$1
  url="${url%%\?*}"

  url="${url#https://www.}"
  url="${url#www.}"

  domain="${url%%/*}"

  whois_info=$(whois $domain)

  if [[ $whois_info =~ CN ]] || [[ $whois_info =~ \.cn ]]; then
    echo 1
  else
    echo 0
  fi
}
