## Install golang


```
. 00_local
./01_go.sh
./02_hub.sh
./02_direnv.sh
./03_virtualenv.sh
./04_gitignore_global.sh
cat bash_profile_go >> ~/.bash_profile
```

## Install tmux


```
. 10_local
20_tmux.sh
cp tmux.conf ~/.tmux.conf
```

## Install ports and nodejs,npm


```
. 10_local
./11_ports.sh
./12_ldconfig.sh
./13_nodejs.sh
./14_clean.sh
cat bash_profile_ports >> ~/.bash_profile
```

## sample configs

* bash_profile_go
* bash_profile_ports
* envrc_git
* envrc_python
* tmux.conf
