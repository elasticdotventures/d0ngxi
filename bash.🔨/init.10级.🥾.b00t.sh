
## * * * *// 
#* Purpose: imports standard bash behaviors
#*          for consistent handling of parameters
#*
## * * * *//

# Boot functions
source "/c0de/_b00t_/_b00t_.bashrc"

# moved to _b00t_.bashrc
# source "$_B00T_C0DE_Path/./bash.ð¨/.bash_aliases"


function checkOS() {
    IS_supported=`cat /etc/os-release | grep "Ubuntu 20.04.2 LTS"`
    if [ -z "$IS_supported" ] ; then
        cat /etc/os-release
        log_ð¢_è®°å½ "ð½ä¸æ¯æ  OS not yet supported." && exit 0
        return 1
    else
        log_ð¢_è®°å½ "ð OS is supported"
    fi

    return 
}
checkOS_result="$(checkOS)"
#echo "checkOS_result: $checkOS_result"


#func(){
#    echo "Username: $USER"
#    echo "    EUID: $EUID"
#}
# ð¤ "Exporting" export -f creates an env variable with the function body.
# export -f func

##* * * * * *\\
if [ "$EUID" -ne 0 ]
  then echo "ð½ Please run as root, use sudo or enter root password" 
  # su "$SUDO_USER" -c 'func'
fi
##* * * * * *//

## å½ä»¤ \\
# MÃ¬nglÃ¬ng // Command   (mkdir)
function mkdir_å½ä»¤() {
    args=("$@")
    dir=${args[0]}
    #dir=$1
    cmd="/bin/mkdir -p \"$dir\""
    result=$( "$cmd" )
    echo "ð $cmd"
    
    if [ ! -d "$dir" ] ; then 
        log_ð¢_è®°å½ "ð½:ä¸æ¯æ failed. probably requires permission!" 

        log_ð¢_è®°å½ "ð.run: sudo $cmd"
        `/usr/bin/sudo $cmd`
        if [ ! -d "$dir" ] ; then 
            log_ð¢_è®°å½ "ð½:ä¸æ¯æ sudo didn't work either."
        fi
    fi
    }

#export mkdir_å½ä»¤
#mkdir_å½ä»¤ "$HOME/.b00t_"
#mkdir_å½ä»¤ "$HOME/.b00t_/c0re"
#chmod 711 "$HOME/._00t_/c0re"
## å½ä»¤ // 


##* * * * * *\\
# Install Some Tooling
# ð° fzf - menu, file choose  https://github.com/junegunn/fzf#using-git
# ð° jq  - JSON config i/o    https://stedolan.github.io/jq/
# ð° wget- HTTP i/o 
# ð° curl- HTTP i/o 

if  [ ! -x "/usr/bin/fzf" ] || \
     [ ! -x "/usr/bin/jq" ] || \
     [ ! -x "/usr/bin/wget" ]  ; then
    $SUDO_CMD apt-get install -y fzf jq wget curl
fi

if n0ta_xfile_ð_å¥½ä¸å¥½ "/usr/bin/fdfind"  ; then
    ## some other applications we'll need
    # ð¤ https://github.com/sharkdp/fd#installation
    $SUDO_CMD apt-get install -y fd-find
    log_ð¢_è®°å½ "ð.install fd-find helper (fd)"

    $SUDO_CMD mkdir -p ~/.local/bin
    $SUDO_CMD ln -s $(which fdfind) ~/.local/bin/fd
fi

if n0ta_xfile_ð_å¥½ä¸å¥½ "/usr/bin/rg" ; then
    # RipGrep
    # ð¤ https://github.com/BurntSushi/ripgrep#installation
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
    log_ð¢_è®°å½ "ð.install ripgrep (rg)"
    $SUDO_CMD dpkg -i ripgrep_12.1.1_amd64.deb
    #OR .. sudo apt-get install ripgrep
fi

if n0ta_xfile_ð_å¥½ä¸å¥½ "/usr/bin/whiptail" ; then 
    # whiptail makes interactive menus
    # ð¤ https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail
    log_ð¢_è®°å½ "ð.install whiptail menus"
    $SUDO_CMD apt-get install -y whiptail
fi

if n0ta_xfile_ð_å¥½ä¸å¥½ "/usr/bin/batcat" ; then 
    log_ð¢_è®°å½ "ð.install batcat (bat), replaces cat"
    $SUDO_CMD apt-get install -y bat
    $SUDO_CMD mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
    # example with fzf:
    # fzf --preview 'batcat --style numbers,changes --color=always {} | head -50'
fi


log_ð¢_è®°å½ "ð¥¾ð.install dialog & apt-utils"
$SUDO_CMD apt-get install -y dialog apt-utils

# _b00t_ cli - "/usr/local/bin/b00t"
## 
if [ ! -f "/usr/local/bin/b00t" ] ; then
    $SUDO_CMD ln -s /c0de/_b00t_/up-cli.sh /usr/local/bin/b00t
fi

##* * * * * *//



