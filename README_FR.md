Le but est de pouvoir utiliser openssh avec mintty (cygwin) comme outil externe dans mRemoteNG.

Si comme moi vous utiliser l'openssh mis à disposition avec Windows 10 pour travailler avec des linux, wsl et autre je n'utilise plus putty parfois difficile à configurer si (comme moi) vous avez besoin d'avoir recours à des configurations complexes pour ProxyCommand comme :
W10 -> Coporate Http Proxy with authentication -> Https [docker] Traefik -> [docker] Nginx proxy -> [docker] wstunnel or webcat -> ssh server
De plus, faire un JumpHost en utilisant une (putty) configuration existante n'est pas très aisée (...)
habitué à la simplicité de la configuration d'un fichier ssh/config coté client sous linux, j'utilise maintenant cette possibilité.

Sous Windows 10, le répertoire .ssh est localisé à %userprofile%/.ssh Il est facilement possible de partager les fichiers avec cygwin avec la commande "ln -s".
Si vous êtes administrateur du votre poste vous pouvez faire un lien sur le dossier, sinon vous devrez faire un lien pour chaque fichiers. 

Avec cygwin il y a une chose à savoir : le fichier ~/.ssh/config ne semble pas implicitement (pas toujours) être lu en fonction de la manière où vous faites l'appel au client ssh (voir https://superuser.com/questions/493270/ssh-config-under-cygwin) 
faire un lien depuis %userprofile%\.ssh\config vers /etc/ssh_config règle le problème

Dernière chose, je n'utilise pas non plus pageant car je store mes clés ssh avec passphrases dans Keepass avec l'entension KeeAgent. Avec cela je n'ai pas besoin de laisser mes fichiers id ssh en local car vous pouvez charger votre base keepass depuis un cloud privatif.

Voilà pourquoi au final je n'utilise plus putty, même s'il nous a rendu bien des services depuis les années 1999 car à vrai dire il n'y avait pas beaucoup d'autres alternatives à cette époque ;-))
