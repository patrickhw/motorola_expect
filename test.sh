#!/bin/bash
#
#
while read hosts
do
echo $hosts
export hosts
/usr/bin/expect ./test.exp $hosts
done < hosts 
