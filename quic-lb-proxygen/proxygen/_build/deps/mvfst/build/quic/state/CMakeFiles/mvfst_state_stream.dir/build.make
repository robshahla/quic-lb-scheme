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
include quic/state/CMakeFiles/mvfst_state_stream.dir/depend.make

# Include the progress variables for this target.
include quic/state/CMakeFiles/mvfst_state_stream.dir/progress.make

# Include the compile flags for this target's objects.
include quic/state/CMakeFiles/mvfst_state_stream.dir/flags.make

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o: quic/state/CMakeFiles/mvfst_state_stream.dir/flags.make
quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o: ../quic/state/stream/StreamStateFunctions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamStateFunctions.cpp

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamStateFunctions.cpp > CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.i

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamStateFunctions.cpp -o CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.s

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.requires:

.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.requires

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.provides: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.requires
	$(MAKE) -f quic/state/CMakeFiles/mvfst_state_stream.dir/build.make quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.provides.build
.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.provides

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.provides.build: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o


quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o: quic/state/CMakeFiles/mvfst_state_stream.dir/flags.make
quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o: ../quic/state/stream/StreamSendHandlers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamSendHandlers.cpp

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamSendHandlers.cpp > CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.i

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamSendHandlers.cpp -o CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.s

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.requires:

.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.requires

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.provides: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.requires
	$(MAKE) -f quic/state/CMakeFiles/mvfst_state_stream.dir/build.make quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.provides.build
.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.provides

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.provides.build: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o


quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o: quic/state/CMakeFiles/mvfst_state_stream.dir/flags.make
quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o: ../quic/state/stream/StreamReceiveHandlers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamReceiveHandlers.cpp

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamReceiveHandlers.cpp > CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.i

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state/stream/StreamReceiveHandlers.cpp -o CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.s

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.requires:

.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.requires

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.provides: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.requires
	$(MAKE) -f quic/state/CMakeFiles/mvfst_state_stream.dir/build.make quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.provides.build
.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.provides

quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.provides.build: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o


# Object files for target mvfst_state_stream
mvfst_state_stream_OBJECTS = \
"CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o" \
"CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o" \
"CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o"

# External object files for target mvfst_state_stream
mvfst_state_stream_EXTERNAL_OBJECTS =

quic/state/libmvfst_state_stream.a: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o
quic/state/libmvfst_state_stream.a: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o
quic/state/libmvfst_state_stream.a: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o
quic/state/libmvfst_state_stream.a: quic/state/CMakeFiles/mvfst_state_stream.dir/build.make
quic/state/libmvfst_state_stream.a: quic/state/CMakeFiles/mvfst_state_stream.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library libmvfst_state_stream.a"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_state_stream.dir/cmake_clean_target.cmake
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_state_stream.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/state/CMakeFiles/mvfst_state_stream.dir/build: quic/state/libmvfst_state_stream.a

.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/build

quic/state/CMakeFiles/mvfst_state_stream.dir/requires: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamStateFunctions.cpp.o.requires
quic/state/CMakeFiles/mvfst_state_stream.dir/requires: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamSendHandlers.cpp.o.requires
quic/state/CMakeFiles/mvfst_state_stream.dir/requires: quic/state/CMakeFiles/mvfst_state_stream.dir/stream/StreamReceiveHandlers.cpp.o.requires

.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/requires

quic/state/CMakeFiles/mvfst_state_stream.dir/clean:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_state_stream.dir/cmake_clean.cmake
.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/clean

quic/state/CMakeFiles/mvfst_state_stream.dir/depend:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/proxygen/proxygen/_build/deps/mvfst /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/state /usr/src/proxygen/proxygen/_build/deps/mvfst/build /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/state/CMakeFiles/mvfst_state_stream.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/state/CMakeFiles/mvfst_state_stream.dir/depend

