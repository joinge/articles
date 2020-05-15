#The name of the project
#project(Framework)

#The CMake Minimum version that is required. The FindCUDA script
#is distributed since version 2.8, and we aim to use it.
cmake_minimum_required(VERSION 2.8)

# set(BUILD_COMMAND latexmk)
# # set(BUILD_ARGS -outdir=${CMAKE_CURRENT_BINARY_DIR} -pdf [=[-pdflatex=xelatex -synctex=1 -interaction=nonstopmode]=])
# # set(BUILD_ARGS -outdir=${CMAKE_CURRENT_BINARY_DIR} -pdf [=[-pdflatex=xelatex -synctex=1 -interaction=nonstopmode]=])
# set(BUILD_ARGS -outdir=${CMAKE_CURRENT_BINARY_DIR} -pdf [=[-pdflatex=pdflatex -synctex=1 -interaction=nonstopmode]=])

# latexmk -output-directory=${CMAKE_BINARY_DIR} -pdflatex='pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error -shell-escape' -pdf ${file}.tex 

set(BUILD_COMMAND latexmk)
set(BUILD_ARGS -output-directory=${CMAKE_BINARY_DIR} -pdflatex='pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error -shell-escape' -pdf )

# set(BUILD_COMMAND xelatex)
# set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -shell-escape -synctex=1 -interaction=nonstopmode)
# set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -shell-escape -synctex=1 -interaction=batchmode) -file-line-error
# set(BUILD_COMMAND pdflatex)
# set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1)
set(DRAFT_ARGS ${BUILD_ARGS} -draftmode)
set(USE_GLOSSARY true)

set(TOP_FILE thesis)

set(SUBFILES
#    preface
   abstract
   frontmatter
   1_introduction
   2_background
   3_publications
   4_discussion
   5_onlook
#    literature_review
#    background
#    derivations
   )
set(SUBFILE_DEPS
#    header.tex
   subheader.in.tex
   variables.tex
   common/uiophd.cls
   common/mytemplate.cls
   )
set(BIBFILES
   ../library.bib
   ../HowtoHowtoCapon/library.bib
   ../ThesisJP/Paper2/cosbib.bib
   ../LCAforActiveSonarImaging/references.bib
   ../Simulator/references.bib
   )
   
# set(SUBFILES_IEEE
#    )
   
# pdflatex -draftmode file
# bibtex file # or biber
# makeindex file.idx # if needed
# makeindex -s style.gls ...# for glossary if needed
# pdflatex -draftmode file
# pdflatex file

# string(REGEX REPLACE "(.+)" "\\1.pdf" SUBFILES_PDF "${SUBFILES}")
# message("${SUBFILES}")
# foreach(file ${SUBFILES})
#    list(APPEND SUBFILES_PDF ${file}.pdf)
#    add_custom_command(
#       OUTPUT ${file}.pdf
#       COMMAND grep Monolithictrue variables.tex ||
#              (${BUILD_COMMAND} ${DRAFT_ARGS} ${file}.tex &&
#               biber --output-directory=${CMAKE_CURRENT_BINARY_DIR} ${file} &&
# #       COMMAND cd build && makeindex ${file}.idx # if needed
# #       COMMAND cd build && makeindex -s style.gls
#               ${BUILD_COMMAND} ${DRAFT_ARGS} ${file}.tex &&
#               ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex
#              )
#       WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#       DEPENDS ${file}.tex subheader.tex variables.tex
#       )
# endforeach()

configure_file(${CMAKE_SOURCE_DIR}/subheader.in.tex
               ${CMAKE_BINARY_DIR}/subheader.tex @ONLY)
               
# add_custom_command(
#    OUTPUT subheader.tex
#    COMMAND grep 'printglossar' ${file}.tex &&
#                  sed s/'@USE_GLOSSARY@'/'true'/g  ${CMAKE_SOURCE_DIR}/subheader.in.tex > subheader.tex ||
#                  sed s/'@USE_GLOSSARY@'/'false'/g ${CMAKE_SOURCE_DIR}/subheader.in.tex > subheader.tex
#    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
#    DEPENDS ${CMAKE_SOURCE_DIR}/subheader.in.tex Clean
#    )
# add_custom_target (Configure ALL
#    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
#    DEPENDS subheader.tex
#    )
# 


add_custom_target(Clean ALL
#    COMMAND rm thesis.log || true
#    COMMAND rm header.fmt || true
#    COMMAND "${CMAKE_COMMAND}" -E remove ${CMAKE_SOURCE_DIR}/*.log
#    COMMAND "${CMAKE_COMMAND}" -E remove ${CMAKE_BINARY_DIR}/*.log
   COMMAND echo "2" > ${CMAKE_BINARY_DIR}/cnt.txt
#    COMMAND echo "" > ${CMAKE_BINARY_DIR}/all.glo
#    COMMAND echo "" > ${CMAKE_SOURCE_DIR}/${TOP_FILE}.log
   WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
   )

#          COMMAND grep Monolithictrue variables.tex ||
#             ((grep 'printglossar' ${file}.tex &&
#                  sed s/'@USE_GLOSSARY@'/'true'/g  subheader.in.tex > ${CMAKE_CURRENT_BINARY_DIR}/subheader.tex ||
#                  sed s/'@USE_GLOSSARY@'/'false'/g subheader.in.tex > ${CMAKE_CURRENT_BINARY_DIR}/subheader.tex ) &&


add_custom_command(
   OUTPUT header.fmt
   COMMAND "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
           "${CMAKE_COMMAND}" -E echo " Precompiling header..." &&
           "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
           git commit -a -m "Auto-commit" &&
           cd ${CMAKE_SOURCE_DIR} &&
#            xelatex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\\"header\\" \\"\\&xelatex\\" mylatexformat.ltx header.tex &&
#            latexmk -output-directory=${CMAKE_BINARY_DIR} -pdflatex='pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error -shell-escape' -pdf ${file}.tex 
           pdftex --output-directory=${CMAKE_BINARY_DIR} -interaction=nonstopmode -shell-escape -halt-on-error  -ini -jobname=\\"header\\" \\"\\&pdflatex\\" mylatexformat.ltx header.tex &&
           "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/header.fmt ${CMAKE_SOURCE_DIR}/header.fmt &&
           "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
   WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
   DEPENDS ${CMAKE_SOURCE_DIR}/header.tex ${SUBFILE_DEPS}
)
add_custom_target(Header
   WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
   DEPENDS header.fmt
   )
add_dependencies(Header Clean)

# pdftex --output-directory=build -ini -jobname="thesis" "&pdflatex" mylatexformat.ltx thesis; cp build/thesis.fmt ./; touch 2_publications.tex thesis.tex
   
function(compile file) # optional: deps
   add_custom_command(
      OUTPUT  "${CMAKE_BINARY_DIR}/${file}.stamp1"
      COMMAND "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " 1st build ${file}.pdf..." &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              cd ${CMAKE_SOURCE_DIR} &&
              ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.pdf        ${CMAKE_SOURCE_DIR}/${file}.pdf &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.synctex.gz ${CMAKE_SOURCE_DIR}/${file}.synctex.gz &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.log        ${CMAKE_SOURCE_DIR}/${file}.log &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E touch "${CMAKE_BINARY_DIR}/${file}.stamp1"
      BYPRODUCTS ${file}.aux ${file}.bcf ${file}.glo ${file}.ist
      DEPENDS ${ARGN}
      )
   add_custom_target("${file}_pdflatex1"
      DEPENDS "${CMAKE_BINARY_DIR}/${file}.stamp1"
      )
   add_dependencies("${file}_pdflatex1" Header)

   add_custom_command(
      OUTPUT "${CMAKE_BINARY_DIR}/${file}.bbl"
      COMMAND "${CMAKE_COMMAND}" -E compare_files "${file}.bcf" "${file}.old.bcf" ||
             ("${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " Biber..." &&
              cd ${CMAKE_SOURCE_DIR} &&
             (biber --output-directory=${CMAKE_BINARY_DIR} ${file} &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.bcf ${CMAKE_BINARY_DIR}/${file}.old.bcf ||
              "${CMAKE_COMMAND}" -E touch ${file}.tex ) &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
             )
      DEPENDS "${CMAKE_BINARY_DIR}/${file}.bcf" ${CMAKE_SOURCE_DIR}/../library.bib
      )
   add_custom_target("${file}_biber"
      DEPENDS "${CMAKE_BINARY_DIR}/${file}.bbl"
      )
   add_dependencies("${file}_biber" "${file}_pdflatex1")
      
   add_custom_command(
      OUTPUT "${CMAKE_BINARY_DIR}/${file}.gls"
      COMMAND "${CMAKE_COMMAND}" -E compare_files ${file}.glo ${file}.old.glo ||
             ("${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " Makeindex..." &&
              makeindex -s ${file}.ist -o ${file}.gls ${file}.glo &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.glo ${CMAKE_BINARY_DIR}/${file}.old.glo &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
             )
      DEPENDS "${CMAKE_BINARY_DIR}/${file}.glo"
      )
   add_custom_target("${file}_makeindex"
      DEPENDS "${CMAKE_BINARY_DIR}/${file}.gls"
      )
   add_dependencies("${file}_makeindex" "${file}_pdflatex1")

   add_custom_command(
      OUTPUT "${CMAKE_BINARY_DIR}/${file}.pdf"
      COMMAND "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " 2nd build ${file}.pdf..." &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              cd ${CMAKE_SOURCE_DIR} &&
              ${BUILD_COMMAND} ${DRAFT_ARGS} ${file}.tex &&
              ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.pdf        ${CMAKE_SOURCE_DIR}/${file}.pdf &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.synctex.gz ${CMAKE_SOURCE_DIR}/${file}.synctex.gz &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.log        ${CMAKE_SOURCE_DIR}/${file}.log &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
      DEPENDS "${CMAKE_BINARY_DIR}/${file}.bbl" "${CMAKE_BINARY_DIR}/${file}.gls"
      )
   add_custom_target("${file}"
      DEPENDS "${CMAKE_BINARY_DIR}/${file}.pdf"
      )
   add_dependencies("${file}" "${file}_biber" "${file}_makeindex")

endfunction()

function(make_log file) # optional: deps
   add_custom_target(${file} ALL
      COMMAND test ! -f ${file}.log || 
            ( cat ${file}.log
              | sed '/Unsupported document class/d'
              | sed '/mdugm/d'
              | sed '/printglossaries found/d'
              | sed '/no file/d'
              >> ${CMAKE_SOURCE_DIR}/${TOP_FILE}.log &&
              cat ${file}.log
              | sed '/Unsupported document class/d'
              | sed '/mdugm/d'
              | sed '/printglossaries found/d'
              | sed '/printglossaries found/d'
              > ${CMAKE_SOURCE_DIR}/${file}.log #&&
            )
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
      DEPENDS ${file}.pdf
      )
endfunction()
   
file(WRITE all.log "" )
# set(last_log "")


foreach(file ${SUBFILES})
   list(APPEND SUBFILES_TEX ${file}.tex)
   list(APPEND SUBFILES_PDF ${file}.pdf)
#    list(APPEND SUBFILES_GLO ${file}.glo)
#    list(APPEND SUBFILES_LOG ${file}.log)

   compile(${file} ${file}.tex ${SUBFILE_DEPS})
#    make_log(${file})
   
#       file(READ build/${file}.log TXT)
#       file(APPEND all.log ${TXT})
endforeach()

compile(I_mvdr I_mvdr.tex 0_article_header.tex ../HowtoHowtoCapon/document.tex ../HowtoHowtoCapon/macros.tex ../HowtoHowtoCapon/library.bib ${SUBFILE_DEPS})
# make_log(I_mvdr)
# 
compile(II_mvdr_ultrasound II_mvdr_ultrasound.tex 0_article_header.tex ../HRUIonGPU/document.tex ../HRUIonGPU/macros.tex ../ThesisJP/Paper2/cosbib.bib ${SUBFILE_DEPS})
# make_log(II_mvdr_ultrasound)
# 
compile(III_lca III_lca.tex 0_article_header.tex ../LCAforActiveSonarImaging/document.tex ../LCAforActiveSonarImaging/macros.tex ../LCAforActiveSonarImaging/references.bib ${SUBFILE_DEPS})
# make_log(III_lca)

compile(IIII_simulator IIII_simulator.tex 0_article_header.tex ../Simulator/document.tex ../Simulator/macros.tex ../Simulator/references.bib ${SUBFILE_DEPS})
# make_log(IIII_simulator)

############
# Glossary #
############
# grep Monolithictrue ../variables.tex ||
#             (
# add_custom_target(start_glo)
# set(last_glo ${SUBFILES_PDF})
# foreach(file ${SUBFILES})
#    add_custom_command(
#       OUTPUT ${file}_cumulative.glo
#       COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
#               echo " Building ${file}.glo" &&
#               ../bin/pagecnt.sh ${file} &&
#               cat ${file}_cumulative.glo >> all.glo
#       WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
#       DEPENDS ${last_glo} ${file}.glo
#       )
#    set(last_glo ${file}_cumulative.glo)
# endforeach()
# add_custom_command(
#    OUTPUT ${TOP_FILE}_cumulative.glo
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
#             echo " Building ${TOP_FILE}_cumulative.glo" &&
#             cat all.glo > ${TOP_FILE}_cumulative.glo #&&
#    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
#    DEPENDS ${last_glo}
#    )
# add_custom_target(Glossary
#    COMMAND cat ${TOP_FILE}_cumulative.glo > ${TOP_FILE}.glo #&&
#    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
#    DEPENDS ${TOP_FILE}_cumulative.glo
#    )
      
# foreach(file ${SUBFILES_IEEE})
#    list(APPEND SUBFILES_PDF ${file}.pdf)
#    add_custom_command(
#       OUTPUT ${file}.pdf
#       COMMAND ${BUILD_COMMAND} ARGS ${DRAFT_ARGS} ${file}.tex
# #       COMMAND pwd && echo "============================="
# #       COMMAND biber ARGS --output-directory=${CMAKE_CURRENT_BINARY_DIR} ${file}
#       COMMAND cd build && makeindex ${file}.idx # if needed
# #       COMMAND cd build && makeindex -s style.gls
#       COMMAND ${BUILD_COMMAND} ARGS ${DRAFT_ARGS} ${file}.tex
#       COMMAND ${BUILD_COMMAND} ARGS ${BUILD_ARGS} ${file}.tex
#       WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#       DEPENDS ${file}.tex subheader.tex
#       )
# endforeach()
# message("${SUBFILES_PDF}")

compile(${TOP_FILE} ${TOP_FILE}.tex ${SUBFILES_TEX} ${BIBFILES} ${SUBFILE_DEPS}
        I_mvdr.tex 0_article_header.tex ../HowtoHowtoCapon/document.tex ../HowtoHowtoCapon/macros.tex ../HowtoHowtoCapon/library.bib
        II_mvdr_ultrasound.tex 0_article_header.tex ../HRUIonGPU/document.tex ../HRUIonGPU/macros.tex ../ThesisJP/Paper2/cosbib.bib
        III_lca.tex 0_article_header.tex ../LCAforActiveSonarImaging/document.tex ../LCAforActiveSonarImaging/macros.tex ../LCAforActiveSonarImaging/references.bib
        IIII_simulator.tex 0_article_header.tex ../Simulator/document.tex ../Simulator/macros.tex ../Simulator/references.bib 
        )

