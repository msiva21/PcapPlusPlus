# - Try to find DPDK include dirs and libraries
#
# Usage of this module as follows:
#
#     find_package(DPDK)
#
# Variables defined by this module:
#
#  DPDK_FOUND                System has DPDK include and library dirs found
#  DPDK_INCLUDE_DIRS         The DPDK include directories.
#  DPDK_LIBRARIES            The DPDK library

find_library(DPDK_LIBRARIES dpdk
	HINTS
	${DPDK_HOME}/lib
	${DPDK_HOME}/build
	${DPDK_HOME}/build/lib
)

find_path(DPDK_INCLUDE_DIRS rte_version.h
	HINTS 
	${DPDK_HOME}/build
	${DPDK_HOME}/include
	${DPDK_HOME}/build/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(DPDK
    REQUIRED_VARS 
		DPDK_LIBRARIES
		DPDK_INCLUDE_DIRS
    FAIL_MESSAGE 
		"DPDK not found! Please specify DPDK_HOME."
)

get_filename_component(DPDK_LIBRARY_PATH ${DPDK_LIBRARIES} DIRECTORY)

set(DPDK_LIBRARIES 
	${DPDK_LIBRARIES}
	${CMAKE_DL_LIBS}
	${CMAKE_THREAD_LIBS_INIT}
	-lnuma
)



