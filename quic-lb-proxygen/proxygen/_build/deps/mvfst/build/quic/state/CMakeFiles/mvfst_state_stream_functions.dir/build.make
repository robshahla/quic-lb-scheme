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
include quic/state/CMakeFiles/mvfst_state_stream_functions.dir/depend.make

# Include the progress variables for this target.
include quic/state/CMakeFiles/mvfst_state_stream_functions.dir/progress.make

# Include the compile flags for this target's objects.
include quic/state/CMakeFiles/mvfst_state_stream_functions.dir/flags.make

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o: quic/state/CMakeFiles/mvfst_state_stream_functions.dir/flags.make
quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o: ../quic/state/QuicStreamFunctions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/QuicStreamFunctions.cpp

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/QuicStreamFunctions.cpp > CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.i

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/QuicStreamFunctions.cpp -o CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.s

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.requires:

.PHONY : quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.requires

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.provides: quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.requires
	$(MAKE) -f quic/state/CMakeFiles/mvfst_state_stream_functions.dir/build.make quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.provides.build
.PHONY : quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.provides

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.provides.build: quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o


# Object files for target mvfst_state_stream_functions
mvfst_state_stream_functions_OBJECTS = \
"CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o"

# External object files for target mvfst_state_stream_functions
mvfst_state_stream_functions_EXTERNAL_OBJECTS =

quic/state/libmvfst_state_stream_functions.a: quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o
quic/state/libmvfst_state_stream_functions.a: quic/state/CMakeFiles/mvfst_state_stream_functions.dir/build.make
quic/state/libmvfst_state_stream_functions.a: quic/state/CMakeFiles/mvfst_state_stream_functions.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libmvfst_state_stream_functions.a"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_state_stream_functions.dir/cmake_clean_target.cmake
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_state_stream_functions.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/state/CMakeFiles/mvfst_state_stream_functions.dir/build: quic/state/libmvfst_state_stream_functions.a

.PHONY : quic/state/CMakeFiles/mvfst_state_stream_functions.dir/build

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/requires: quic/state/CMakeFiles/mvfst_state_stream_functions.dir/QuicStreamFunctions.cpp.o.requires

.PHONY : quic/state/CMakeFiles/mvfst_state_stream_functions.dir/requires

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/clean:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_state_stream_functions.dir/cmake_clean.cmake
.PHONY : quic/state/CMakeFiles/mvfst_state_stream_functions.dir/clean

quic/state/CMakeFiles/mvfst_state_stream_functions.dir/depend:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/proxygen/proxygen/_build/deps/mvfst /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state /usr/src/proxygen/proxygen/_build/deps/mvfst/build /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state/CMakeFiles/mvfst_state_stream_functions.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/state/CMakeFiles/mvfst_state_stream_functions.dir/depend

