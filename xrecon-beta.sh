#!/bin/bash
#Sets the prompt to cusom to show, that xrecon is open
PS3="xrecon$:"

startmessage()

{
#START WELCOME MESSAGE

	clear && echo ""
echo " ________ _______  _       _________ _______  ________  _                "
echo "|  ____  ||  ____ \| \    /|\__   __/|       ||  ____ \| \    /||\     /|"
echo "| |    | || |    \/|  \  | |   | |   | || || || |    \/|  \  | || |   | |"
echo "| |____| || |__    |   \ | |   | |   | || || || |__    |   \ | || |   | |"
echo "|  ______||  __)   | |\ \| |   | |   | ||_|| ||  __)   | |\ \| || |   | |"
echo "| |       | |      | | \   |   | |   | |   | || |      | | \   || |   | |"
echo "| |       | |____/\| |  \  |   | |   | |   | || |____/\| |  \  || |___| |"
echo "|/        (_______/|/    \_|   |_|   |/     \||_______/|/    \_||_______|"
echo ""
echo "--------------IMPORTANT--------------"
echo "Welcome to xrecon!"
echo "Consider reporting bugs if possible"
echo "This software is only for responsible, authorised use."
echo "YOU are responsible for your own actions!"
echo "Please also review the readme at https://raw.githubusercontent.com/GinjaChris/pentmenu/master/README.md before proceeding"
echo ""
mainmenu
#END WELCOME MESSAGE##
}


#MAINMENU
mainmenu()
{
#main menu using bash select
#from here, the various sub menus can be selected and from them, modules can be run
mainmenu=("Recon" "Network audition" "DOS" "Extraction" "View Readme" "Quit")
select opt in "${mainmenu[@]}"; do
	if [ "$opt" = "Quit" ]; then
	echo "Quitting...Thanks for using xrecon!" && sleep 1 && clear
	exit 0
	elif [ "$opt" = "Network audition" ]; then
reconmenu
	elif [ "$opt" = "DOS" ]; then
dosmenu
    elif [ "$opt" = "Extraction" ]; then
extractionmenu
  	elif [ "$opt" = "View Readme" ]; then
showreadme
	else
#if no valid option is chosen, chastise the user
	echo "That's not a valid option! Hit Return to show main menu"
	fi
done
}
#END OF MAINMENU








#ROOT CHECK
#everything before this is a function and functions have to be defined before they can be used
#so the welcome message MUST be placed at the end of the script
if [[ $EUID -ne 0 ]]; 
    then
    echo "You should run this script as root" 
    exit 0
    else
    startmessage
fi

