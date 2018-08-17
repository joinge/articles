cmake_minimum_required(VERSION 3.0)

set(BUILD_COMMAND pdflatex)
# set(BUILD_COMMAND xelatex)
# set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -shell-escape -synctex=1 -interaction=nonstopmode)
# set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -shell-escape -synctex=1 -interaction=batchmode)
set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -file-line-error -shell-escape -synctex=1)
set(DRAFT_ARGS ${BUILD_ARGS} -draftmode)
set(USE_GLOSSARY true)

set(TOP_FILE article)

set(BIBFILES
   references.bib
   )
   
function(compile file) # optional: deps
   add_custom_target("${file}"
      COMMAND "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " 1st build ${file}.pdf..." &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              cd ${CMAKE_SOURCE_DIR} &&
#               latexmk -output-directory=${CMAKE_BINARY_DIR} -xelatex --synctex=1 -interaction=nonstopmode -file-line-error --shell-escape ${file}.tex &&
              latexmk -output-directory=${CMAKE_BINARY_DIR} -xelatex --synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error --shell-escape ${file}.tex &&
#               ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.pdf        ${CMAKE_SOURCE_DIR}/${file}.pdf &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.synctex.gz ${CMAKE_SOURCE_DIR}/${file}.synctex.gz &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.log        ${CMAKE_SOURCE_DIR}/${file}.log &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
      DEPENDS ${ARGN}
      )
#    add_custom_target("${file}_pdflatex1"
#       DEPENDS "${CMAKE_BINARY_DIR}/${file}.stamp1"
#       )

#    add_custom_command(
#       OUTPUT "${CMAKE_BINARY_DIR}/${file}.bbl"
#       COMMAND "${CMAKE_COMMAND}" -E compare_files "${CMAKE_BINARY_DIR}/${file}.bcf" "${CMAKE_BINARY_DIR}/${file}.bcf" &&
#                 # Biber if bcf file exist
#                 ("${CMAKE_COMMAND}" -E compare_files "${CMAKE_BINARY_DIR}/${file}.bcf" "${CMAKE_BINARY_DIR}/${file}.old.bcf" ||
#                    ("${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
#                     "${CMAKE_COMMAND}" -E echo " Biber..." &&
#                     cd ${CMAKE_SOURCE_DIR} &&
#                    (biber --output-directory="${CMAKE_BINARY_DIR}" ${file} &&
#                    "${CMAKE_COMMAND}" -E copy "${CMAKE_BINARY_DIR}/${file}.bcf" "${CMAKE_BINARY_DIR}/${file}.old.bcf" ||
#                    "${CMAKE_COMMAND}" -E touch ${file}.tex ) &&
#                    "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
#                    )
#                 ) ||
#                 # Bibtex if bcf file doesn't exist
#                 ("${CMAKE_COMMAND}" -E compare_files "${CMAKE_BINARY_DIR}/${file}.aux" "${CMAKE_BINARY_DIR}/${file}.old.aux" ||
#                    ("${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
#                     "${CMAKE_COMMAND}" -E echo " Bibtex..." &&
#                     cd ${CMAKE_BINARY_DIR} &&
#                    (bibtex ${file} &&
#                    "${CMAKE_COMMAND}" -E copy "${CMAKE_BINARY_DIR}/${file}.aux" "${CMAKE_BINARY_DIR}/${file}.old.aux" ||
#                    "${CMAKE_COMMAND}" -E touch ${CMAKE_SOURCE_DIR}/${file}.tex ) &&
#                    "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
#                    )
#                 )
#       DEPENDS "${CMAKE_BINARY_DIR}/${file}.stamp1" ${BIBFILES}
#       )
#    add_custom_target("${file}_biber"
#       DEPENDS "${CMAKE_BINARY_DIR}/${file}.bbl"
#       )
#    add_dependencies("${file}_biber" "${file}_pdflatex1")
# 
#    add_custom_command(
#       OUTPUT "${CMAKE_BINARY_DIR}/${file}.pdf"
#       COMMAND "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#               "${CMAKE_COMMAND}" -E echo " 2nd build ${file}.pdf..." &&
#               "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#               cd ${CMAKE_SOURCE_DIR} &&
#               ${BUILD_COMMAND} ${DRAFT_ARGS} ${file}.tex &&
#               ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex &&
#               "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.pdf        ${CMAKE_SOURCE_DIR}/${file}.pdf &&
#               "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.synctex.gz ${CMAKE_SOURCE_DIR}/${file}.synctex.gz &&
#               "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.log        ${CMAKE_SOURCE_DIR}/${file}.log &&
#               "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
#       DEPENDS "${CMAKE_BINARY_DIR}/${file}.bbl"
#       )
#    add_custom_target("${file}"
#       DEPENDS "${CMAKE_BINARY_DIR}/${file}.pdf"
#       )
#    add_dependencies("${file}" "${file}_biber")

endfunction()

   
compile(${TOP_FILE} document.tex macros.tex)
