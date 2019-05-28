#!/bin/bash


#  read config file, set some env vars for building

if [ "$#" -ne 1 ]; then
	echo "Using standard config file name 'config.cfg'..."
	CFG="config.cfg"
else
	CFG=$1
fi

while IFS= read -r line; do
  line=${line%%#*}
  case $line in
    *:*)
      var=${line%%:*}
      case $var in
        *[!A-Z_a-z]*)
          echo "Warning: invalid variable name $var ignored" >&2
          continue;;
      esac


	  #echo "$var"
      if eval '[ -n "${'$var'+1}" ]'; then
        echo "Warning: variable $var already set, redefinition ignored" >&2
        continue
      fi
	  line=$(echo ${line#*:} | tr -d ' ')
	  #echo "$line"
      eval $var='"$line"'
  esac
done <"$CFG"

#  get uid and gid for existing user and group names
D_UID=$(getent passwd "${D_USERNAME}" | cut -d: -f3)
D_GID=$(getent group "${D_GROUP}" | cut -d: -f3)

# export for build context
export D_USERNAME=${D_USERNAME}
export D_UID=${D_UID}
export D_GROUP=${D_GROUP}
export D_GID=${D_GID}
