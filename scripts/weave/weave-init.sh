#!/bin/bash

echo WEAVE_PEERS="192.168.1.3 192.168.1.4 192.168.1.5" > /etc/weave.env
echo WEAVEPROXY_ARGS="--rewrite-inspect" >> /etc/weave.env
echo WEAVE_PASSWORD="Ns683KtGhzXk6JCn5Mv86h93SWa" >> /etc/weave.env