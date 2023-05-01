while true; do
    # Prompt the user to enter a number
    clear
    echo "::::VNF placement with RRU/RCC::::"
    echo "What do you want to do:"
    echo "1 -> scenario1-core-up"
    echo "2 -> scenario2-core-up"
    echo "3 -> ran-up"
    echo "4 -> ran-down"
    echo "5 -> all-down"
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
            echo "scenario1-core-up..."
            sh -c 'cd ../configs/core && bash core-up.sh'
            sh -c 'cd ../configs/spgw-cc && bash spgw-up.sh'
            ;;
        2)
            echo "scenario2-core-up..."
            sh -c 'cd ../configs/core && bash core-up.sh'
            sh -c 'cd ../configs/spgw-mec && bash spgw-up.sh'
            ;;
        3)
            echo "ran-up..."
            sh -c 'cd ../configs/rcc-rru && bash ran-up.sh'
            ;;
        4)
            echo "ran-down..."
            sh -c 'cd ../configs/rcc-rru && bash ran-down.sh'
            ;;
        5)
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