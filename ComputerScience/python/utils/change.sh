


subs="s+^template=+extends=+;    s+^extends=+extends=/ComputerScience/python/+;   /extends/s+//+/+;"


function dosed(){
sed -i.bak -e "$subs" $1
}

function traverse() {   

for file in `ls $1`
do
    current=${1}${file}
    if [ ! -d ${1}${file} ] ; then
        if [ "pl" == "${file##*.}" ] ; then 
            #if grep  "//" $current ; then
            #echo "$current as a //" 
            #fi
            
            if grep -q "^template=" $current ; then 
                dosed $current
            elif  grep -q "^extends=" $current ; then 
               dosed $current
            fi
	#else
	#echo " not a pl file : ${1}$file "
	fi 
    else
        #echo "entering recursion with: ${1}${file}"
            traverse "${1}${file}/"
    fi
done
}

function main() {
    traverse $1
}

main $1
