# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /usr/src/proxygen/proxygen/_build/deps/mvfst

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /usr/src/proxygen/proxygen/_build/deps/mvfst/build

# Include any dependencies generated for this target.
include quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/depend.make

# Include the progress variables for this target.
include quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/progress.make

# Include the compile flags for this target's objects.
include quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/flags.make

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o: quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/flags.make
quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o: ../quic/flowcontrol/QuicFlowController.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/flowcontrol/QuicFlowController.cpp

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/flowcontrol/QuicFlowController.cpp > CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.i

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/flowcontrol/QuicFlowController.cpp -o CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.s

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.requires:

.PHONY : quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.requires

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.provides: quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.requires
	$(MAKE) -f quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/build.make quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.provides.build
.PHONY : quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.provides

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.provides.build: quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o


# Object files for target mvfst_flowcontrol
mvfst_flowcontrol_OBJECTS = \
"CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o"

# External object files for target mvfst_flowcontrol
mvfst_flowcontrol_EXTERNAL_OBJECTS =

quic/flowcontrol/libmvfst_flowcontrol.a: quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o
quic/flowcontrol/libmvfst_flowcontrol.a: quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/build.make
quic/flowcontrol/libmvfst_flowcontrol.a: quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libmvfst_flowcontrol.a"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_flowcontrol.dir/cmake_clean_target.cmake
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_flowcontrol.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/build: quic/flowcontrol/libmvfst_flowcontrol.a

.PHONY : quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/build

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/requires: quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/QuicFlowController.cpp.o.requires

.PHONY : quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/requires

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/clean:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_flowcontrol.dir/cmake_clean.cmake
.PHONY : quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/clean

quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/depend:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/proxygen/proxygen/_build/deps/mvfst /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/flowcontrol /usr/src/proxygen/proxygen/_build/deps/mvfst/build /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/flowcontrol/CMakeFiles/mvfst_flowcontrol.dir/depend

