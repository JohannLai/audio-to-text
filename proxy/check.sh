#!/bin/bash

function check {
  # get dommain name from url and remove www
  domain=$(echo $1 | sed -e 's/https\?:\/\///' -e 's/www\.//')

  whois_info=$(whois $domain)

  if [[ $whois_info =~ CN ]] || [[ $whois_info =~ .cn ]]; then
    return 1
  else
    return 0
  fi
}
