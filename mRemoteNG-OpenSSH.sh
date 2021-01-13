#!/usr/bin/env bash

sshcmd="$(which ssh)"

for i in "$@"; do
	case $1 in
		-h=*) 
      if [ ${#i} -gt 3 ] 
        then  
          hostname="${i#*=}"; 
          sshcmd="$sshcmd $hostname"; 
        else
          echo "Host missing, exit !"
          exit 1
      fi
      shift;;
		
    -u=*) 
      if [ ${#i} -gt 3 ] 
        then  
          username="${i#*=}"; 
          # echo username=$username; 
          sshcmd="$sshcmd -l $username"; 
      fi
      shift;;

		-p=*) 
      if [ ${#i} -gt 3 ] 
        then  
          port="${i#*=}"; 
          # echo port=$port; 
          sshcmd="$sshcmd -p $port"; 
      fi
      shift;;

		-f=*) 
      if [ ${#i} -gt 3 ] 
        then  
          SSHConfigFile="${i#*=}"; 
          # echo SSHConfigFile=$SSHConfigFile; 
          sshcmd="$sshcmd -F $SSHConfigFile"; 
        else
          sshcmd="$sshcmd -F ~/.ssh/config"
      fi
      shift;;

		*) ;;
	esac
done

echo "$sshcmd"
eval "${sshcmd[@]}"
