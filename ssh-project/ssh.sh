servers=()

while true; do

    echo "============server manager============"
    echo "1. Add a server"
    echo "2. list server"
    echo "3. Check server health"
    echo "4. ssh inside a server"
    echo "5. Exit"
    echo "  "

    read -p "Make you choice: " choice
 
    case $choice in
        1)
            read -p "enter server ip: " ip
            servers+=("$ip")
            echo "server added successfully"
            ;;
        2)
            echo "list server is : "
            for ip in "${servers[@]}"; do
                echo "$ip"
            done
            ;;
        3)
            for ip in "${servers[@]}"; do
                if ping -c 1 -w 2 $ip > /dev/null 2>&1; then
                    echo "$ip is up"
                else
                    echo "$ip is down"
                fi
            done
            ;;
        4)
            for ip in "${servers[@]}"; do
                #read -p "enter ip you want ssh" ip
                echo "$ip"
                read -p "enter username you want ssh:  " user
                if ssh "$user@$ip" "exit" > /dev/null 2>&1; then
                    echo "SSH connection successful!!!!"
                else
                    echo "SSH connection failed "
                fi
            done
            ;;
        5)
            exit 0
    esac 
done