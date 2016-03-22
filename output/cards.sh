#!/bin/bash
cd /afs/cern.ch/user/d/dgordon/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit/data_cards/
for filename in *.txt; do
	str="$( cut -d '.' -f 1 <<< "$filename")";
        str=$str"-output.txt"
	>> output/test3.txt 
   	combine -M Asymptotic "$filename" | tee output/test3.txt
	mv output/test3.txt output/$str
done
cd ..
cd output


#mv output/test3.txt output/"$str"

