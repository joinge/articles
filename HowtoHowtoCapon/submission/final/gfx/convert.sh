#!/bin/bash

for i in $(ls ../../../gfx/buske*eps); do
   FN=${i##*/}
   echo "cp $i ${FN%*.eps}_online.eps"
   cp $i ${FN%*.eps}_online.eps
   echo "${FN%*.eps}_online.eps > make black and white > $FN"
   gs -sDEVICE=psgray -dNOPAUSE -dBATCH -dSAFER -sOutputFile=tmp.eps ${FN%*.eps}_online.eps
   ps2eps tmp.eps
   mv tmp.eps.eps $FN
#    echo "../bw_convert ${FN%*.eps}_online.eps $FN"
#    ../bw_convert ${FN%*.eps}_online.eps $FN
done
# ../bw_convert buske
# cp beamforming.eps buske1.eps
# cp implementation.eps buske2.eps
# cp mvdr_complexity.eps buske3.eps
# cp mvdr_build_R.eps buske4.eps
# # # # cp buildR-breakdown.eps buske5.eps
# cp mvdr_implementation.eps buske6.eps
# cp plot_holmengraa_L16_Navg1.eps buske7.eps
# cp benchmark.eps buske8.eps
# cp code_assessment.eps buske9.eps
# cp code_assess_flops.eps buske10.eps
# cp benchmark_boston.eps buske11.eps
