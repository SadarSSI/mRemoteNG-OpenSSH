# mRemoteNG-OpenSSH
So this is quick tip to use opensh with WITHOUT putty. You just need de cygwin, mintty and openssh

Once these prerequisites are installed, you will need to declare an external tool with the following parameters:

displayname = openssh
FileName = [PathTo]\mintty.exe
Arguments =-d -o exec bash -cli "[PathTo]/mRemoteNG_OpenSSH.sh -h=%HOSTNAME% -u=%USERNAME% -p=%PORT%"
FileName -> like a windows path
Arguments -> like a cygwin path

Some explanations :
If like me you have openssh with windows 10, you should have a .ssh folder located --> %userprofile%.ssh

You can see with the following cygwin command :
 - \# ls $ (cygpath $USERPROFILE)/.ssh/config

in this case, make link from % userprofile%\.ssh\config file to /etc/ssh_config **) with this command :
 - \# ln -s $(cygpath $USERPROFILE)/.ssh/config /etc/ssh_config

You can also make links from your files $USERPROFILE)/.ssh/xxx to ~/.ssh/xxx:

 - \# mkdir ~ / .ssh ## if necessary

 - \# ln -s $(cygpath $USERPROFILE)/.ssh/id_ed25519 ~/.ssh/id_ed25519
 - \# ln -s $(cygpath $USERPROFILE)/.ssh/id_ed25519.pub ~/.ssh/id_ed25519.pub
 - \# ln -s $(cygpath $USERPROFILE)/.ssh/authorized_keys ~/.ssh/authorized_keys

NB: if you have admin rights on Windows you should be able to link to the directory. I do not have admin rights on my corporate windows 10 (...)

 - \# ln -s $(cygpath $USERPROFILE)/.ssh ~/.ssh

For me the advantage of using openssh :

To have the same file for windows, linux, wsl
 - Easy to use the cascade Jump via another host configuration in the .ssh/config file
 - easy to write ProxyCommand parameters
 - In some cases I have to go through corporate http proxy with authentication such as

W10 -> Corporate http proxy -> [docker] Traefic (https) -> [docker] Nginx Proxy -> [docker] SocketServer -> ssh-server

For me, it is easier to configure all this via a simple ssh/config file even if putty we have been providing service since 1999!

Last thing:
I use KeePass to store my ssh keys with passphrases and it works perfectly without pageant, no need local ssh keys on W10, linux, etc.

hope this helps while waiting for OpenSSH to work directly with mRemoteNG

**) see https://superuser.com/questions/493270/ssh-config-under-cygwin
