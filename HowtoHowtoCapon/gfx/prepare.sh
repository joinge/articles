#!/bin/bash

FILES=" \
   beamforming.svg \
   implementation.svg \
   mvdr_complexity.svg \
   mvdr_build_R.svg \
   buildR-breakdown.svg \
   mvdr_implementation.svg \
   plot_holmengraa_L16_Navg1.eps \
   benchmark.eps \
   code_assessment.eps \
   code_assess_flops.eps \
   benchmark_boston.eps \
   "

cp beamforming.eps buske1_online.eps
cp implementation.eps buske2_online.eps

cp mvdr_complexity_bw.eps buske3_bw.eps
cp mvdr_complexity.eps buske3_online.eps

cp mvdr_build_R_bw.eps buske4_bw.eps
cp mvdr_build_R.eps buske4_online.eps

cp buildR-breakdown_bw.eps buske5_bw.eps
cp buildR-breakdown.eps buske5_online.eps

cp mvdr_implementation_bw.eps buske6_bw.eps
cp mvdr_implementation.eps buske6_online.eps

cp plot_holmengraa_L16_Navg1.eps buske7_bw.eps
cp plot_holmengraa_L16_Navg1.eps buske7_online.eps

cp benchmark_bw.eps buske8_bw.eps
cp benchmark.eps buske8_online.eps

cp code_assessment_bw.eps buske9_bw.eps
cp code_assessment.eps buske9_online.eps

cp code_assess_flops_bw.eps buske10_bw.eps
cp code_assess_flops.eps buske10_online.eps

cp benchmark_boston.eps buske11_online.eps

# Coverts eps file to black-white using ghostscript
function makeEpsBW {
   gs -sDEVICE=psgray -dNOPAUSE -dBATCH -dSAFER -sOutputFile=tmp.eps $1
   ps2eps tmp.eps
   mv tmp.eps.eps $2
}

# inkscape --select=svg2 --verb org.inkscape.color.grayscale --export-eps=buske1_bw.eps beamforming.svg
# inkscape --select=svg2 --verb org.inkscape.color.grayscale --export-eps=buske2_bw.eps implementation.svg
# inkscape --select=svg2 --verb org.inkscape.color.grayscale --export-eps=buske4_bw.eps mvdr_build_R.svg
# inkscape --select=svg2 --verb org.inkscape.color.grayscale --export-eps=buske6_bw.eps mvdr_implementation.svg

# makeEpsBW buske3_online.eps buske3_bw.eps
# makeEpsBW buske5_online.eps buske5_bw.eps
# makeEpsBW buske8_online.eps buske8_bw.eps
# makeEpsBW buske9_online.eps buske9_bw.eps
# makeEpsBW buske10_online.eps buske10_bw.eps
# makeEpsBW buske11_online.eps buske11_bw.eps

# for i in $(ls buske*eps); do
#    FN=${i##*/}
#    echo "cp $i ${FN%*.eps}_online.eps"
#    cp $i ${FN%*.eps}_online.eps
#    echo "${FN%*.eps}_online.eps > make black and white > $FN"
#    
#    # Method 1: Inkscape to the rescue
#    inkscape --select=svg2 --verb org.inkscape.color.grayscale --export-eps=${FN%*.eps}_bw.eps beamforming3.svg
#    
#    # Method 2: Semi-working
# #    gs -sDEVICE=psgray -dNOPAUSE -dBATCH -dSAFER -sOutputFile=tmp.eps ${FN%*.eps}_online.eps
# #    ps2eps tmp.eps
# #    mv tmp.eps.eps ${FN%*.eps}_bw.eps
# 
#    # Method 3: Sucks
# #    echo "../bw_convert ${FN%*.eps}_online.eps $FN"
# #    ../bw_convert ${FN%*.eps}_online.eps $FN
# done