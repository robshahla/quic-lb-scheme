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
include quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/depend.make

# Include the progress variables for this target.
include quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/progress.make

# Include the compile flags for this target's objects.
include quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/flags.make

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/flags.make
quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o: ../quic/fizz/client/handshake/FizzClientQuicHandshakeContext.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/fizz/client/handshake/FizzClientQuicHandshakeContext.cpp

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/fizz/client/handshake/FizzClientQuicHandshakeContext.cpp > CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.i

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/fizz/client/handshake/FizzClientQuicHandshakeContext.cpp -o CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.s

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.requires:

.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.requires

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.provides: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.requires
	$(MAKE) -f quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/build.make quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.provides.build
.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.provides

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.provides.build: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o


quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/flags.make
quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o: ../quic/fizz/client/handshake/FizzClientHandshake.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/fizz/client/handshake/FizzClientHandshake.cpp

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/fizz/client/handshake/FizzClientHandshake.cpp > CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.i

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/fizz/client/handshake/FizzClientHandshake.cpp -o CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.s

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.requires:

.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.requires

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.provides: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.requires
	$(MAKE) -f quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/build.make quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.provides.build
.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.provides

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.provides.build: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o


# Object files for target mvfst_fizz_client
mvfst_fizz_client_OBJECTS = \
"CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o" \
"CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o"

# External object files for target mvfst_fizz_client
mvfst_fizz_client_EXTERNAL_OBJECTS =

quic/fizz/client/libmvfst_fizz_client.a: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o
quic/fizz/client/libmvfst_fizz_client.a: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o
quic/fizz/client/libmvfst_fizz_client.a: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/build.make
quic/fizz/client/libmvfst_fizz_client.a: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libmvfst_fizz_client.a"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_fizz_client.dir/cmake_clean_target.cmake
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_fizz_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/build: quic/fizz/client/libmvfst_fizz_client.a

.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/build

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/requires: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientQuicHandshakeContext.cpp.o.requires
quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/requires: quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/handshake/FizzClientHandshake.cpp.o.requires

.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/requires

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/clean:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_fizz_client.dir/cmake_clean.cmake
.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/clean

quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/depend:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/proxygen/proxygen/_build/deps/mvfst /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/fizz/client /usr/src/proxygen/proxygen/_build/deps/mvfst/build /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/fizz/client/CMakeFiles/mvfst_fizz_client.dir/depend

