#The name of the project
#project(Framework)

#The CMake Minimum version that is required. The FindCUDA script
#is distributed since version 2.8, and we aim to use it.
cmake_minimum_required(VERSION 2.8)

# set(BUILD_COMMAND latexmk)
# # set(BUILD_ARGS -outdir=${CMAKE_CURRENT_BINARY_DIR} -pdf [=[-pdflatex=xelatex -synctex=1 -interaction=nonstopmode]=])
# # set(BUILD_ARGS -outdir=${CMAKE_CURRENT_BINARY_DIR} -pdf [=[-pdflatex=xelatex -synctex=1 -interaction=nonstopmode]=])
# set(BUILD_ARGS -outdir=${CMAKE_CURRENT_BINARY_DIR} -pdf [=[-pdflatex=pdflatex -synctex=1 -interaction=nonstopmode]=])

set(BUILD_COMMAND pdflatex)
# set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -shell-escape -synctex=1 -interaction=nonstopmode)
# set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -shell-escape -synctex=1 -interaction=batchmode)
set(BUILD_ARGS -output-directory=${CMAKE_CURRENT_BINARY_DIR} -shell-escape -synctex=1)
set(DRAFT_ARGS -draftmode ${BUILD_ARGS})
set(USE_GLOSSARY true)

set(TOP_FILE thesis)

set(SUBFILES
#    preface
#    abstract
#    1_introduction
   2_publications
#    3_discussion
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
   COMMAND rm thesis.log || true
#    COMMAND rm header.fmt || true
#    COMMAND echo "2" > ${CMAKE_BINARY_DIR}/cnt.txt
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
   COMMAND "${CMAKE_COMMAND}" -E echo "" &&
           "${CMAKE_COMMAND}" -E echo "" &&
           "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
           "${CMAKE_COMMAND}" -E echo " Precompiling header..." &&
           "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
           cd ${CMAKE_SOURCE_DIR} &&
           pdftex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\\"header\\" \\"\\&pdflatex\\" mylatexformat.ltx header.tex &&
           "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/header.fmt ${CMAKE_SOURCE_DIR}/header.fmt &&
           "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
   WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
   DEPENDS ${CMAKE_SOURCE_DIR}/header.tex Clean
)

# pdftex --output-directory=build -ini -jobname="thesis" "&pdflatex" mylatexformat.ltx thesis; cp build/thesis.fmt ./; touch 2_publications.tex thesis.tex
   
function(compile file) # optional: deps
#     add_custom_command(
#     OUTPUT ${file}.fmt
#     COMMAND  echo "" && echo "" &&
#                 echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#                 echo " Precompiling header..." &&
#                 echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#     #             echo "pdftex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\"header\" \"&pdflatex\" mylatexformat.ltx header.tex"
#                 pdftex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\\"${file}\\" \\"\\&pdflatex\\" mylatexformat.ltx ${file}.tex &&
#                 cp ${CMAKE_BINARY_DIR}/${file}.fmt ${file}.fmt
#     COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#     DEPENDS ${file}.tex Clean
#     )
   add_custom_command(
      OUTPUT  ${file}.aux ${file}.bcf ${file}.glo ${file}.ist
      COMMAND "${CMAKE_COMMAND}" -E echo "" &&
              "${CMAKE_COMMAND}" -E echo "" &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " Building ${file}.pdf..." &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              cd ${CMAKE_SOURCE_DIR} &&
              ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.pdf        ${CMAKE_SOURCE_DIR}/${file}.pdf &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.synctex.gz ${CMAKE_SOURCE_DIR}/${file}.synctex.gz &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" #&&
#               "${CMAKE_COMMAND}" -E touch "${file}.stamp1"
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
      DEPENDS ${ARGN} header.fmt
      )
   add_custom_target("${file}_pdflatex1"
      DEPENDS ${file}.aux ${file}.bcf ${file}.glo ${file}.ist
      )
#    set_source_files_properties(${file}.aux
#                                ${file}.bcf
#                                ${file}.glo
#                                ${file}.ist
#                                PROPERTIES GENERATED TRUE)
   add_custom_command(
      OUTPUT ${file}.bbl
      COMMAND "${CMAKE_COMMAND}" -E compare_files "${file}.bcf" "${file}.old.bcf" ||
             ("${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " Biber..." &&
              cd ${CMAKE_SOURCE_DIR} &&
              biber --output-directory=${CMAKE_BINARY_DIR} ${file} &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.bcf ${CMAKE_BINARY_DIR}/${file}.old.bcf &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
             )
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
      DEPENDS "${file}_pdflatex1" ${file}.bcf
      )
   add_custom_target("${file}_biber"
      DEPENDS ${file}.bbl
      )
      
   add_custom_command(
      OUTPUT ${file}.gls
      COMMAND "${CMAKE_COMMAND}" -E compare_files ${file}.glo ${file}.old.glo ||
             ("${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " Makeindex..." &&
              makeindex -s ${file}.ist -o ${file}.gls ${file}.glo &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.glo ${CMAKE_BINARY_DIR}/${file}.old.glo &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
             )
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
      DEPENDS "${file}_pdflatex1" ${file}.glo ${file}.ist
      )
   add_custom_target("${file}_makeindex"
      DEPENDS ${file}.gls
      )
#    set_source_files_properties(
# #               ${file}.aux
#               ${file}.bbl # biber references
# #               ${file}.bcf # pdflatex bibliography references
# #               ${file}.glo # pdflatex glossary references
# #               ${file}.ist
#               PROPERTIES GENERATED true)
   add_custom_command(
      OUTPUT ${file}.pdf
      COMMAND "${CMAKE_COMMAND}" -E echo "" &&
              "${CMAKE_COMMAND}" -E echo "" &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              "${CMAKE_COMMAND}" -E echo " Building ${file}.pdf..." &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
              cd ${CMAKE_SOURCE_DIR} &&
              ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.pdf        ${CMAKE_SOURCE_DIR}/${file}.pdf &&
              "${CMAKE_COMMAND}" -E copy ${CMAKE_BINARY_DIR}/${file}.synctex.gz ${CMAKE_SOURCE_DIR}/${file}.synctex.gz &&
              "${CMAKE_COMMAND}" -E echo "~~~~~~~~~~~~~~~~~~~~~~~"
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
      DEPENDS "${file}_biber" ${file}.bbl "${file}_makeindex" ${file}.gls
      )
   add_custom_target(${file}
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
      DEPENDS ${file}.pdf
      )
#    set_source_files_properties(
#               ${file}.aux
#               ${file}.bbl # biber references
#               ${file}.bcf # pdflatex bibliography references
#               ${file}.glo # pdflatex glossary references
#               ${file}.ist
#               PROPERTIES GENERATED true)
#    add_custom_command(
#       OUTPUT ${file}.pdf ${file}.glo
#       COMMAND cat ${CMAKE_BINARY_DIR}/cnt.txt &&
#               echo "" && echo "" &&
#               echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#               echo " Building ${file}.pdf..." &&
#               echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#               ${BUILD_COMMAND} ${DRAFT_ARGS} ${file}.tex &&
#               echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
#               echo " Biber..." &&
#               biber --output-directory=${CMAKE_CURRENT_BINARY_DIR} ${file} &&
#               echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
#               echo " \\(Re\\)building ${file}.pdf \\(draft\\)" &&
#               ${BUILD_COMMAND} ${DRAFT_ARGS} ${file}.tex &&
#               echo "~~~~~~~~~~~~~~~~~~~~~~~" &&
#               echo " \\(Re\\)building ${file}.pdf \\(final\\)..." &&
#               ${BUILD_COMMAND} ${BUILD_ARGS} ${file}.tex &&
#               cp ${CMAKE_BINARY_DIR}/${file}.pdf ${file}.pdf &&
#               cp ${CMAKE_BINARY_DIR}/${file}.synctex.gz ${file}.synctex.gz
#       COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#       WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#       DEPENDS ${ARGN} Configure #PrecompiledSubHeader
#       )
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

# add_custom_command(
#    OUTPUT header.fmt
#    COMMAND  echo "" && echo "" &&
#             echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#             echo " Precompiling header..." &&
#             echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
# #             echo "pdftex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\"header\" \"&pdflatex\" mylatexformat.ltx header.tex"
#             pdftex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\\"header\\" \\"\\&pdflatex\\" mylatexformat.ltx header.tex &&
#             cp ${CMAKE_BINARY_DIR}/header.fmt header.fmt
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    DEPENDS header.tex Clean
#    )
# add_custom_target (PrecompiledHeader ALL
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    DEPENDS header.fmt
#    )
# 
# add_custom_command(
#    OUTPUT subheader.fmt
#    COMMAND grep 'printglossar' ${file}.tex &&
#                  sed s/'@USE_GLOSSARY@'/'true'/g  subheader.in.tex > ${CMAKE_CURRENT_BINARY_DIR}/subheader.tex ||
#                  sed s/'@USE_GLOSSARY@'/'false'/g subheader.in.tex > ${CMAKE_CURRENT_BINARY_DIR}/subheader.tex &&
#             echo "" && echo "" &&
#             echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
#             echo " Precompiling header..." &&
#             echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" &&
# #             echo "pdftex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\"header\" \"&pdflatex\" mylatexformat.ltx header.tex"
#             pdftex --output-directory=${CMAKE_BINARY_DIR} -ini -jobname=\\"subheader\\" \\"\\&pdflatex\\" mylatexformat.ltx subheader.tex &&
#             cp ${CMAKE_BINARY_DIR}/subheader.fmt subheader.fmt
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    DEPENDS subheader.in.tex Clean
#    )
# add_custom_target (PrecompiledSubHeader ALL
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    DEPENDS subheader.fmt
#    )
# set(SUBFILE_DEPS ${SUBFILE_DEPS} header.fmt)
# pdftex --output-directory=build -ini -jobname="header" "&pdflatex" mylatexformat.ltx header.tex

foreach(file ${SUBFILES})
   list(APPEND SUBFILES_PDF ${file}.pdf)
#    list(APPEND SUBFILES_GLO ${file}.glo)
#    list(APPEND SUBFILES_LOG ${file}.log)

   compile(${file} ${file}.tex ${SUBFILE_DEPS})
#    make_log(${file})
   
#       file(READ build/${file}.log TXT)
#       file(APPEND all.log ${TXT})
endforeach()

# compile(I_mvdr I_mvdr.tex 0_article_header.tex ../HowtoHowtoCapon/document.tex ../HowtoHowtoCapon/macros.tex ${SUBFILE_DEPS})
# make_log(I_mvdr)
# 
# compile(II_mvdr_ultrasound II_mvdr_ultrasound.tex 0_article_header.tex ../HRUIonGPU/document.tex ../HRUIonGPU/macros.tex ${SUBFILE_DEPS})
# make_log(II_mvdr_ultrasound)
# 
# compile(III_lca III_lca.tex 0_article_header.tex ../LC AforActiveSonarImaging/document.tex ../LCAforActiveSonarImaging/macros.tex ${SUBFILE_DEPS})
# make_log(III_lca)


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

# add_custom_command(
#    OUTPUT ${TOP_FILE}.pdf
#    COMMAND ${BUILD_COMMAND} ARGS ${DRAFT_ARGS} ${TOP_FILE}.tex
#    COMMAND biber ARGS ${TOP_FILE}
# #    COMMAND makeindex ARGS ${TOP_FILE}.idx # if needed
# #    COMMAND makeindex ARGS -s style.gls
#    COMMAND ${BUILD_COMMAND} ARGS ${DRAFT_ARGS} ${TOP_FILE}.tex
#    COMMAND ${BUILD_COMMAND} ARGS ${BUILD_ARGS} ${TOP_FILE}.tex
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    DEPENDS ${SUBFILES_PDF} ${TOP_FILE}.tex header.tex variables.tex
#    )

# compile(${file} ${file}.tex header.tex subheader.in.tex variables.tex common/uiophd.cls common/mytemplate.cls Clean)

# message(${SUBFILES_PDF})

compile(${TOP_FILE} ${TOP_FILE}.tex ${SUBFILE_DEPS})

# add_custom_command(
#    OUTPUT ${TOP_FILE}.pdf
#    COMMAND echo "" && echo ""
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#    COMMAND echo " Building ${TOP_FILE}.pdf "
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#    COMMAND ${BUILD_COMMAND} ARGS ${DRAFT_ARGS} ${TOP_FILE}.tex
# #    COMMAND test ! -f thesis.bcf || biber --output-directory=${CMAKE_CURRENT_BINARY_DIR} ${TOP_FILE}
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#    COMMAND echo " Biber..."
#    COMMAND biber --output-directory=${CMAKE_CURRENT_BINARY_DIR} ${TOP_FILE}
# #    COMMAND makeindex ARGS ${TOP_FILE}.idx # if needed
# #    COMMAND makeindex ARGS -s style.gls
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#    COMMAND echo " Makeindex..."
#    COMMAND cd ${CMAKE_BINARY_DIR} && makeindex -s ${TOP_FILE}.ist -o ${TOP_FILE}.gls ${TOP_FILE}_cumulative.glo
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#    COMMAND echo " \\(Re\\)building ${TOP_FILE}.pdf \\(draft\\)..."
#    COMMAND ${BUILD_COMMAND} ${DRAFT_ARGS} ${TOP_FILE}.tex
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#    COMMAND echo " \\(Re\\)building ${TOP_FILE}.pdf \\(final\\)..."
#    COMMAND ${BUILD_COMMAND} ${BUILD_ARGS} ${TOP_FILE}.tex
#    COMMAND echo "~~~~~~~~~~~~~~~~~~~~~~~"
#    COMMAND cp build/${TOP_FILE}.pdf ${TOP_FILE}.pdf
# #    COMMAND ${BUILD_COMMAND} ${BUILD_ARGS} ${TOP_FILE}.tex
# #    COMMAND "${CMAKE_COMMAND}" -E create_symlink build/${TOP_FILE}.log ${TOP_FILE}.log
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#    DEPENDS Glossary ${SUBFILES_PDF}  ${TOP_FILE}.tex header.tex variables.tex common/uiophd.cls common/mytemplate.cls Clean
#    )
#    I_mvdr.pdf II_mvdr_ultrasound.pdf III_lca.pdf
   
# file(READ build/${TOP_FILE}.log TXT)
# file(APPEND all.log ${TXT})

# add_custom_target(thesis
# #    COMMAND cat ${CMAKE_BINARY_DIR}/thesis.log >> thesis.log
# #    COMMAND awk [=['!a[$0]++']=] thesis.log
# #    COMMAND "${CMAKE_COMMAND}" -E create_symlink build/all.log all.log
#    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
#    DEPENDS ${TOP_FILE}.pdf
#    )
#    
#       add_custom_target(${file} ALL
#       COMMAND cat build/${file}.log >> thesis.log
#       WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#       DEPENDS ${file}.pdf Clean
#       )
   
# 
# include(CheckTypeSize)
# check_type_size("void*" SIZEOF_VOID_P BUILTIN_TYPES_ONLY)
# 
# message( ${SIZEOF_VOID_P} )
# 
# # Make the scripts available in the 'cmake' directory available for the
# # 'include()' command, 'find_package()' command.
# set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_CURRENT_SOURCE_DIR})
# 
# 
# # Include configuration file, i.e. settings that differ from computer to computer
# if( EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake )
#    include( Config )
# else()
#    include( ConfigExample )
# endif()
# 
# # Set defaults for the options not defined in Config.cmake
# if(NOT DEFINED USE_CUDA)
#    set(USE_CUDA TRUE)
# endif()
# 
# # To suport spesification of build type from the command line  
# if(DEFINED BT)
#    set( CMAKE_BUILD_TYPE ${BT} )
# endif()
#    
# # Make sure one of the valid build types are selected:
# if(CMAKE_BUILD_TYPE STREQUAL Release)
#    message("Build type: Release")
# elseif(CMAKE_BUILD_TYPE STREQUAL Debug)
#    message("Build type: Debug")
#    add_definitions(-DVERBOSE)
# elseif(CMAKE_BUILD_TYPE STREQUAL Profile)
#    message("Build type: Profile")
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_RELEASE}")
#    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS_DEBUG} ${CMAKE_C_FLAGS_RELEASE}")
#    add_definitions(-UVERBOSE)
# else()
#    message(FATAL_ERROR "Invalid build type: ${CMAKE_BUILD_TYPE}")
# endif()
# 
# 
# # ??? What have you done here Jo? use 64bit?
# set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS 1)
# 
# 
# # Add sweet colors to make output process (optional, of course :)
# # set( CMAKE_VERBOSE_MAKEFILE on ) 
# set(CMAKE_COLOR_MAKEFILE ON)
#   
# 
# # Include all directories that contain a CMakeLists.txt by default
# set(CMAKE_INCLUDE_CURRENT_DIR ON) 
# 
# 
# ########
# # UNIX #
# ########
# 
# if (UNIX)
#    add_definitions(-Wall -Wextra)
# endif(UNIX) 
# 
# 
# #################
# # VISUAL STUDIO #
# #################
# 
# # Is now taken care by install command!
# #if (MSVC90) # If Visual Studio... 
#    #... move shared lib out of Release/Debug folders
#    #   message(STATUS "You are using Visual Studio 2008")
#    #set(CMAKE_STATIC_LIBRARY_PREFIX "../")
#    #set(CMAKE_SHARED_LIBRARY_PREFIX "../")
#    #set(PYTHON_MODULE_PREFIX "../")
#    #endif()
# 
# 
# ########################
# # SYSTEM INCLUDE PATHS #
# ########################
# 
# find_path(STDIO_INCLUDE_PATH stdio.h) # only linux?
# include_directories("${STDIO_INCLUDE_PATH}/dummy/../")
# 
# 
# ###################
# # PYTHON / CYTHON #
# ###################
# 
# # Python is used throughout, might aswell include the headers here
# find_package(PythonModules)
# include_directories( ${NUMPY_INCLUDE_DIR} )
# 
# # The Eclipse generator creates a project name with an '@' in it. Pydev dislikes this,
# # so we call this little cmake script to make that '@' into an '-' instead.
# add_custom_target( FixEclipseProject ALL "${CMAKE_COMMAND}" -P
#    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FixEclipseProject.cmake
#    ${CMAKE_CURRENT_BINARY_DIR} )
# 
# # With CMake, a clean separation can be made between the source tree and the
# # build tree. When all source is compiled, as with pure C/C++, the source is
# # no-longer needed in the build tree. However, with pure *.py source, the
# # source is processed directly. To handle this, we reproduce the availability
# # of the source files in the build tree.
# # add_custom_target( FixEclipseProject ALL sed s+'@'+'-'+ ${CMAKE_BINARY_DIR}/.project
# # WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} VERBATIM)
# 
# # Include the CMake script UseCython.cmake. This defines add_cython_module().
# # Instruction for use can be found at the top of cmake/UseCython.cmake.
# include(UseCython)
# include(PythonifyCython)
# include(PythonifyCythonFunction)
# 
# # Set some Cython options
# set(CYTHON_ANNOTATE ON)
# set(CYTHON_FLAGS "--verbose" "-X profile=False,cdivision=True,wraparound=False,boundscheck=False")
# # set(CYTHON_FLAGS "--verbose" "-X profile=False,cdivision=False,wraparound=True,boundscheck=True")
# #set(CYTHON_FLAGS "-X profile=False,cdivision=True,wraparound=False,boundscheck=False")
# 
# # Unset the Py_DEBUG flag in python source code to avoid VS linking against the python
# # debug library (which doesn't seem to exist by default on windows machines)
# if( WIN32 )
#   add_definitions(-UPy_DEBUG)
# endif()
# 
# #########################
# # REPLICATE SOURCE TREE #
# #########################
# 
# add_custom_target( ReplicateSourceTree ALL "${CMAKE_COMMAND}" -P
#    ${CMAKE_SOURCE_DIR}/cmake/ReplicateSourceTree.cmake
#    ${CMAKE_BINARY_DIR}
#    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} )
# 
# 
# ########
# # CUDA #
# ########
# 
# if( NOT DEFINED USE_CUDA OR USE_CUDA )
# 
#     find_package(CUDA)
#     include(FindCUDA)
#     
#     # If ${CUDA_SDK_ROOT_DIR} is empty, make sure NVSDKCUDA_ROOT environment variable is set
#     include_directories(${CUDA_INCLUDE_DIRS})
#     
#     #message(${CUDA_SDK_ROOT_DIR})
#     include_directories("${CUDA_SDK_ROOT_DIR}/common/inc")
#     
#     # Since some CUDA versions are short of some header files we need, we've copied these
#     # to this folder:
#     include_directories(${CMAKE_SOURCE_DIR}/cuda/include)
#     
#     
#     #message(${CUDA_SDK_ROOT_DIR})
#     #message(${CUDA_SDK_ROOT_DIR}/common/lib/linux/x86_64)
#     # Put SDK libs in library search path
#     if ( UNIX )
#        #link_directories("${CUDA_SDK_ROOT_DIR}/common/lib/linux/x86_64")
#        get_filename_component( CUDA_LIBS ${CUDA_CUBLAS_LIBRARIES} PATH ) 
#        link_directories( ${CUDA_LIBS} )
#        #message( ${CUDA_SDK_ROOT_DIR}/lib )
#     elseif ( WIN32 )
#        if (CMAKE_CL_64)
#           link_directories( ${CUDA_TOOLKIT_ROOT_DIR}/lib/x64 )
#           link_directories( ${CUDA_SDK_ROOT_DIR}/common/lib/x64 )
#        else ()
#           link_directories( ${CUDA_TOOLKIT_ROOT_DIR}/lib/Win32 )
#           link_directories( ${CUDA_SDK_ROOT_DIR}/common/lib/Win32 )
#        endif ()
#     endif ()
#     
#     #message( "   Build Type: ${CMAKE_BUILD_TYPE}" )
#     # Setup build flags for Windows and Linux 
#     if(CMAKE_BUILD_TYPE STREQUAL Debug)
#        if( WIN32 )
#           set( NVCC_FLAGS -g --ptxas-options=-v)# -G0) # -g is for host debug info, -G0 is for device debug info
#        else()
#           set( NVCC_FLAGS -g -G -lineinfo --ptxas-options=-v --profile -Xcompiler -fPIC )
#        endif()
#     endif()
#     if(CMAKE_BUILD_TYPE STREQUAL Release)
#        if( WIN32 )
#           set( NVCC_FLAGS -use_fast_math -O --ptxas-options=-v )
#        else()
#           set( NVCC_FLAGS -use_fast_math -O --ptxas-options=-v -Xcompiler -fPIC )
#     #      set( NVCC_FLAGS -O --ptxas-options=-v -Xcompiler -fPIC )
#        endif()
#     endif()
#     if(CMAKE_BUILD_TYPE STREQUAL Profile)
#        if( WIN32 )
#           #set( NVCC_FLAGS -g --ptxas-options=-v)# -G0) # -g is for host debug info, -G0 is for device debug info
#           set( NVCC_FLAGS -g -use_fast_math -O --ptxas-options=-v )
#        else()
#           #set( NVCC_FLAGS -g -G -lineinfo --ptxas-options=-v --profile -Xcompiler -fPIC )
#           set( NVCC_FLAGS -g -G -use_fast_math -O --ptxas-options=-v -Xcompiler -fPIC )
#        endif()
#     endif()
#     #
#     set(CUDA_NVCC_FLAGS ${NVCC_FLAGS}
#        #-gencode arch=compute_11,code=\\\"compute_11,sm_11\\\"
#        #-gencode arch=compute_13,code=\\\"compute_13,sm_13\\\"
#        -gencode arch=compute_20,code=\\\"compute_20,sm_20\\\"
#        -gencode arch=compute_20,code=\\\"compute_20,sm_21\\\"
#     )
#     
# endif()
# 
# #######
# # MEX #
# #######
# 
# find_package(Matlab-rwp)
# include(MatlabMakeMacros)
# 
# # Compile with the '-g' flag? 
# if(CMAKE_BUILD_TYPE STREQUAL Debug)
#    set(MEX_DEBUG_SYMBOLS ON)
# endif()
# if(CMAKE_BUILD_TYPE STREQUAL Profile)
#    set(MEX_DEBUG_SYMBOLS ON)
# endif()
# 
# # dotMatlab.cpp does not work when compiled in 64bit mode, so we'll compile
# # with 32bit compatibility enabled
# #set( MEX_32BIT_COMPATIBLE ON )s
# 
# 
# # MKL
# #######
# 
# if(USE_MKL)
#    find_package(MKL)
#    include_directories( ${MKL_INCLUDE_DIR} )
#    link_directories( ${INTEL_LIBRARY_DIR} ${MKL_LIBRARY_DIR} )
#    add_definitions(-DUSE_MKL)
# endif()
# 
# 
# 
# ############
# # INCLUDES #
# ############
# 
# include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/framework/lib )
# include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/framework/linalg )
# include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/framework/beamformer/capon/RealTimeCapon )
#  
# 
# ##################
# # SUBDIRECTORIES #
# ##################
# 
# add_subdirectory( framework )
# add_subdirectory( sandbox )
# 
# ########################
# # PRINT ALL VARIABLES? #
# ########################
# 
# if( PRINT_VARIABLES )
#    get_cmake_property(_variableNames VARIABLES)
#    foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#    endforeach()
# endif()
# 
# 
# ###########
# # JO INGE #
# ###########
# 
# add_subdirectory( jo )
# 
# 
# ##############
# # JON PETTER #
# ##############
# add_subdirectory( jp )
