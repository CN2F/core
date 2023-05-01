while true; do
    # Prompt the user to enter a number
    clear
    echo "Testcases:"
    echo "1 -> Slicing with eNB"
    echo "2 -> VNF placement with RRU/RCC"
    echo "3 -> VNF placement with eNB"
    echo "0 -> exit"
    echo "----------"
    read num

    # Check the user's input and perform the appropriate action
    case $num in
        0)
            echo "Exiting..."
            exit 0
            ;;
        1)
            echo "Slicing with eNB"
            cd slicing
            bash demo.sh
            cd ..
            ;;
        2)
            echo "VNF placement with RRU/RCC"
            cd vnf1
            bash demo.sh
            cd ..
            ;;
        3)
            echo "VNF placement with eNB"
            cd vnf2
            bash demo.sh
            cd ..
            ;;
        *)
            echo "Invalid input."
            ;;
    esac

    echo "Press anykey to continue..."
    read any
    # Continue running the loop
done
