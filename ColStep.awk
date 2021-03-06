#!/usr/bin/awk -f
##******************************************************************
## Calculate the cumulative value at each step (100 steps in total).
##
## Usage: awk -f ColStep.awk -v row=1000 col=1 TargetFile
##
## Parameters:
##        row       total used rows (default: 1000)
##        col       column to calculate steps (default: 1)
##******************************************************************

BEGIN{
	FS=OFS="\t"
	if(!row)row=1000
	if(!col)col=1
	for(i=1;i<=100;i++){
		Rows[i]=int(row/100)*i
	}
	RowN=1
	print "step","value","cumulative_value"
}

{
	SumCol+=$col
	if(NR==Rows[RowN]){
		print RowN,$col,SumCol
		RowN++
	}else{
		next
	}
}
