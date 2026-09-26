init_balance=1000

while true; do
    echo "----------------------------------------"
    echo "Welcome to simpe Bank"
    echo "1. Deposit"
    echo "2. Withdraw"
    echo "3. Check Balance"
    echo "4. Exit"
    echo "5.Statement"
    echo "----------------------------------------"
    read -p  "Choose an option: " choose
    case $choose in
        1)
            read -p "Enter amount to deposit: " amount
            echo "Deposited $amount"
            deposit=$((init_balance+amount))
            echo "New Balance: $deposit"
            ;;
        2)
            read -p "Enter amount to withdraw: " withd
            if [[ $deposit -gt $withd ]]; then
                deposit=$((deposit-withd))
                deposit_withd=$deposit
                echo "$deposit_withd"
                echo "Withdrew $withd"
                #echo "New balance: $deposit"
            else
                echo "Insufficient funds!!"
            fi
            ;;
        3)
            echo "Your current balance: $deposit"
            ;;
        4)
            echo "Goodbye!"
            exit 0 
            ;;
        5)
            echo "-----Account Statement-------"
            echo "Total Deposit: $amount"
            echo "Total Withdraw: $withd"
            echo "Current Amount: $deposit_withd"
            ;;
        *)
            echo "Invalide option!!"
            echo "Please choose a valid option"
    esac
done