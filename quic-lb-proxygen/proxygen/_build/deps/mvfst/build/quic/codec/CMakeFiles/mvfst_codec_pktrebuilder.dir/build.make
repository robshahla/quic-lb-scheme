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
include quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/depend.make

# Include the progress variables for this target.
include quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/progress.make

# Include the compile flags for this target's objects.
include quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/flags.make

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o: quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/flags.make
quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o: ../quic/codec/QuicPacketRebuilder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/codec/QuicPacketRebuilder.cpp

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/codec/QuicPacketRebuilder.cpp > CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.i

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/codec/QuicPacketRebuilder.cpp -o CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.s

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.requires:

.PHONY : quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.requires

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.provides: quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.requires
	$(MAKE) -f quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/build.make quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.provides.build
.PHONY : quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.provides

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.provides.build: quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o


# Object files for target mvfst_codec_pktrebuilder
mvfst_codec_pktrebuilder_OBJECTS = \
"CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o"

# External object files for target mvfst_codec_pktrebuilder
mvfst_codec_pktrebuilder_EXTERNAL_OBJECTS =

quic/codec/libmvfst_codec_pktrebuilder.a: quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o
quic/codec/libmvfst_codec_pktrebuilder.a: quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/build.make
quic/codec/libmvfst_codec_pktrebuilder.a: quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libmvfst_codec_pktrebuilder.a"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_codec_pktrebuilder.dir/cmake_clean_target.cmake
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_codec_pktrebuilder.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/build: quic/codec/libmvfst_codec_pktrebuilder.a

.PHONY : quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/build

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/requires: quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/QuicPacketRebuilder.cpp.o.requires

.PHONY : quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/requires

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/clean:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_codec_pktrebuilder.dir/cmake_clean.cmake
.PHONY : quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/clean

quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/depend:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/proxygen/proxygen/_build/deps/mvfst /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/codec /usr/src/proxygen/proxygen/_build/deps/mvfst/build /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/codec/CMakeFiles/mvfst_codec_pktrebuilder.dir/depend

