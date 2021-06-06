#!/bin/bash
# To use it:
# 1. sed -i 's/\r//' kv_bash.sh
# 2. source kv_bash.sh
# 3. Use commands below

kv_file="./kv.txt"
sep=", "

# Example del_value <key>
del_value() {
  key="$1"
  #  Replace string that contains {key} to #tombstone#
  #  Regex for "{key}, *"
  sed -i "s/$key$sep.*/#tomstone#/" $kv_file
}

# Example: set_value <key> <value>
set_value() {
	key="$1"
	value="$2"
  #	Deleting old one before using new one
	del_value $key
	echo "$key$sep$value" >> $kv_file
}

# Example: get_value <key>
get_value() {
	key="$1"
  # greps line with key	(regex: "{key}, .*")
  # and also deletes "{key}, " so there only value left
	grep -o "$key$sep.*" $kv_file | sed "s/$key$sep//"
}
