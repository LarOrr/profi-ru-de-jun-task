### Simple bash key value storage 
If file was edited on Windows:
````
sed -i 's/\r//' kv_bash.sh 
````
To use commands:
````
source kv_bash.sh
````
It stores data in file "./kv.txt"

Commands:
1. get_value [key] - get by key
2. del_value [key] - delete key (set line to "#tombstone#")
3. set_value [key] [value] - delete old value (set line to "#tombstone#") and 
add new (key, value) pair at the end of the file 