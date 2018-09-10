#!/bin/bash
set -e

C9_ARGS=""

# conditionally set authentication paremeters
if [[ ! -z "${C9_USER}" ]] && [[ ! -z "${C9_PASS}" ]]; then

  echo Using basic authentication "${C9_USER}:${C9_PASS}"

  C9_ARGS="--auth ${C9_USER}:${C9_PASS}"

else
  echo No basic authentication defined

fi

# update args in conf
sed -i "s/@@SED_ARGS_REPLACE@@/${C9_ARGS}/" /etc/supervisor/conf.d/cloud9.conf

supervisord -c /etc/supervisor/supervisord.conf
