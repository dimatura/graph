SET(GUROBI_ROOT_DIR "" CACHE PATH "gurobi root directory")

if(WIN32)
    FIND_PATH(GUROBI_INCLUDE_DIR gurobi_c++.h PATHS "${GUROBI_ROOT_DIR}/win64/include")
    FIND_LIBRARY(GUROBI_LIBRARY gurobi46.lib PATHS "${GUROBI_ROOT_DIR}/win64/lib")
    FIND_LIBRARY(GUROBI_CPP_LIBRARY_RELEASE gurobi_c++md2010.lib PATHS "${GUROBI_ROOT_DIR}/win64/lib")
    FIND_LIBRARY(GUROBI_CPP_LIBRARY_DEBUG gurobi_c++mdd2010.lib PATHS "${GUROBI_ROOT_DIR}/win64/lib")
    set(GUROBI_CPP_LIBRARY "optimized;${GUROBI_CPP_LIBRARY_RELEASE};debug;${GUROBI_CPP_LIBRARY_DEBUG}")
else()
    FIND_PATH(GUROBI_INCLUDE_DIR gurobi_c++.h PATHS "~/gurobi452/linux64/include")
    FIND_LIBRARY(GUROBI_LIBRARY libgurobi45.so PATHS "~/gurobi452/linux64/lib")
    FIND_LIBRARY(GUROBI_CPP_LIBRARY libgurobi_c++.a PATHS "~/gurobi452/linux64/lib")
endif()

IF(GUROBI_INCLUDE_DIR AND GUROBI_LIBRARY AND GUROBI_CPP_LIBRARY)
   SET(GUROBI_FOUND TRUE)
   MESSAGE(STATUS "Gurobi found.")
ELSE()
   MESSAGE("Gurobi NOT found.")
ENDIF()

