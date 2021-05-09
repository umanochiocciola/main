#! bin/bash

trash=$HOME/.local/share/Trash/files
dump=$HOME/.dumpster

getinfo() {

	echo *                          DUMPSTER                          *
	echo *                                                            *                  
	echo * -s <source>          change trashcan source                *
	echo * -d <destination>     change dumpster folder                *
	echo * -b                   burn everything in the dumpster       *
	echo * -c                   check: have a look at your dumpster   *
	echo *                                                            *
	exit 0
}

show() {

	ls $dump
	echo ------------
	echo $dump
	exit 0
}

while getopts s:d:bch flag; do
  case "${flag}" in
    s) trash=${OPTARG} ;;
    d) dump=${OPTARG}  ;;
    b) rm -rf $dump    ;;
    c) show            ;;
    h) getinfo         ;;
  esac
done

echo
echo WasteBasket position: $trash
echo fancy dumpster position: $dump

python3 dumpster.py $trash $dump