#!/bin/bash

# run the script as source cards.sh datacard_subfolder
# datacard_subfolder is the subfolder in which the cards are

subfolder=$1;

cd /afs/cern.ch/user/d/dgordon/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit/data_cards/$1/
mvacuts=()
counter=0
for filename in *.txt; do
<<<<<<< HEAD
	str="$( cut -d '.' -f 3 <<< "$filename")";
	mva_cut="0.$str";
	#echo $mva_cut;
	combine -M Asymptotic -m $mva_cut "$filename";
	#echo $counter
	mvacuts+=($mva_cut)
        ((counter++))
done
max=0
min=5
for i in "${mvacuts[@]}"
do
	if [[ "$i" > "$max" ]]; then
		max="$i"
	fi
	
	if [[ "$i" < "$min" ]]; then
		min="$i"
	fi
done

echo $max
echo $min

files=$(find . -name 'higgs*.root')
hadd "$1-cards.root" $files 
rm $files
mv "$1-cards.root" /afs/cern.ch/user/d/dgordon/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit
cd /afs/cern.ch/user/d/dgordon/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit
python plotExpectedVBFLim.py "$1-cards.root" $min $max 
mv vbflimit.pdf "$1-cards-plot.pdf"

#mv output/test3.txt output/"$str"

