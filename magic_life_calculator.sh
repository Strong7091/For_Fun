#!/bin/bash

#This is a life tracker script used to manage a players life throughout a game.

#This fist portion creates a hidden file used to store the life total value.
clear
echo "20" > ./.life.txt

#Creates a title screen for the script. It also shows an opening 20 Life total for the player.
echo "M.T.G. Life Counter"
sleep 2
clear
echo "Beginning Life Total: $(cat ./.life.txt)"

#Creates a simple menu that uses numerical values to make player choices.
answers="Tracker Reset Quit"
select choice in $answers
do
case $choice in

        #Tracker tracks life totals and allows a player to insert - or + values to be added together.
        Tracker)
                clear
                echo "Current Life Total: $(cat ./.life.txt)" &&
                echo
                echo "Please write total change in life total in the following format: X or -X" &&
                read input &&
                echo "$input+$(cat ./.life.txt)" | bc > ./.mtgcalc.txt &&
                rm ./.life.txt
                mv ./.mtgcalc.txt ./.life.txt
                clear
                echo "Current Life Total: $(cat ./.life.txt)"
                echo
                echo "Press ENTER key to view options again."
                ;;

        #Reset allows the player to reset life points to the default 20 to begin a new game.
        Reset)
                echo "20" > ./.life.txt
                clear
                echo "Current Life Total: $(cat ./.life.txt)"
                echo
                echo "Press ENTER key to view options again."
                ;;

        #Quit allows the user to quit the script and clean up the .life.txt file upon exit.
        Quit)
                rm ./.life.txt
                clear
                echo "Goodbye!"
                sleep 2
                clear
                exit
                ;;

        #The wildcard is a catch-all for user input. It will notify the user they made a selection that doesnt exist.
        *)
                echo "Invaild option: $REPLY"
                ;;
esac
done
