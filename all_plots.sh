#!/bin/bash
cd /afs/cern.ch/user/d/dgordon/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit/data_cards
for d in MLP* ; do
   cd /afs/cern.ch/user/d/dgordon/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit/data_cards/output 
   echo "$d"
   source cards.sh "$d"
   cd /afs/cern.ch/user/d/dgordon/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit/data_cards/output
done
