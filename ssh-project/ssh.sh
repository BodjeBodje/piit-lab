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
    esac 
done