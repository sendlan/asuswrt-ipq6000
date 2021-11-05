#!/bin/sh

set_reg_data() {
	ret=`ssdk_sh debug phy set $1 $2 $3`
	[ "$?" != "0" ] && echo "fail to set data:$3 to reg:$2"
}

get_reg_data() {
	reg_data=`ssdk_sh debug phy get $1 $2 | grep [Data] | awk -F ':' '{print $2}'`
	#echo $reg_data | awk '{print int($0)}'
	echo $reg_data | awk '{printf("%d\n", $0)}'
}

printfmt() {
	printf "0x%x" $1
}

#read reg rangs $1: phy_addr $2: first_regaddr, $3:increment, $4:last_regaddr
get_reg_rang() {
	phy_addr=$1
	for reg_addr in $(seq $2 $3 $4)
	do
		reg_data=$(get_reg_data $phy_addr $reg_addr)
		echo "the reg_data[$(printfmt $reg_addr)]: $(printfmt $reg_data)"
	done
}

get_dbgreg_rang() {
	phy_addr=$1
	for reg_addr in $(seq $2 $3 $4)
	do
		set_reg_data $phy_addr 0x1d $reg_addr
		reg_data=$(get_reg_data $phy_addr 0x1e)
		echo "the dbg reg_data[$(printfmt $reg_addr)]: $(printfmt $reg_data)"
	done
}

phy_addr=$1

echo "phy_addr $phy_addr: data start"
get_reg_rang $phy_addr 0 1 0x1f
get_dbgreg_rang $phy_addr 0 1 0x3f
get_reg_rang $phy_addr 0x40078024 1 0x40078027
echo "phy_addr $phy_addr: data end"

