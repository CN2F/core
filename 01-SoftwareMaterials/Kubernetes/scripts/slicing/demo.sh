while true; do
    # Prompt the user to enter a number
    clear
    echo "::::Slicing with eNB::::"
    echo "What do you want to do:"
    echo "1 -> core-up"
    echo "2 -> ran + flexran up"
    echo "3 -> ran-down"
    echo "4 -> all-down"
    echo "0 -> back"
    echo "----------"
    read num

    # Check the user's input and perform the appropriate action
    case $num in
        0)
            echo "back to home..."
            exit 0
            ;;
        1)
            echo "core-up..."
            sh -c 'cd ../configs/core && bash core-up.sh'
            sh -c 'cd ../configs/spgw-cc && bash spgw-up.sh'
            ;;
        2)
            echo "ran-up..."
            sh -c 'cd ../configs/eNB-flexran && bash ran-up.sh'
            ;;
        3)
            echo "ran-down..."
            sh -c 'cd ../configs/eNB-flexran && bash ran-down.sh'
            ;;
        4)
            echo "all-down..."
            sh -c 'cd ../configs && bash all-down.sh'
            ;;
        *)
            echo "Invalid input."
            ;;
    esac

    echo "Press anykey to continue..."
    read any
    # Continue running the loop
done