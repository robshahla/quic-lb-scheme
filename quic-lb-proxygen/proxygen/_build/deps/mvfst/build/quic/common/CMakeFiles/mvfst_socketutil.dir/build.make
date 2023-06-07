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
include quic/common/CMakeFiles/mvfst_socketutil.dir/depend.make

# Include the progress variables for this target.
include quic/common/CMakeFiles/mvfst_socketutil.dir/progress.make

# Include the compile flags for this target's objects.
include quic/common/CMakeFiles/mvfst_socketutil.dir/flags.make

quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o: quic/common/CMakeFiles/mvfst_socketutil.dir/flags.make
quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o: ../quic/common/SocketUtil.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/common/SocketUtil.cpp

quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/common/SocketUtil.cpp > CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.i

quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/common/SocketUtil.cpp -o CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.s

quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.requires:

.PHONY : quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.requires

quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.provides: quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.requires
	$(MAKE) -f quic/common/CMakeFiles/mvfst_socketutil.dir/build.make quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.provides.build
.PHONY : quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.provides

quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.provides.build: quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o


# Object files for target mvfst_socketutil
mvfst_socketutil_OBJECTS = \
"CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o"

# External object files for target mvfst_socketutil
mvfst_socketutil_EXTERNAL_OBJECTS =

quic/common/libmvfst_socketutil.a: quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o
quic/common/libmvfst_socketutil.a: quic/common/CMakeFiles/mvfst_socketutil.dir/build.make
quic/common/libmvfst_socketutil.a: quic/common/CMakeFiles/mvfst_socketutil.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libmvfst_socketutil.a"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_socketutil.dir/cmake_clean_target.cmake
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_socketutil.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/common/CMakeFiles/mvfst_socketutil.dir/build: quic/common/libmvfst_socketutil.a

.PHONY : quic/common/CMakeFiles/mvfst_socketutil.dir/build

quic/common/CMakeFiles/mvfst_socketutil.dir/requires: quic/common/CMakeFiles/mvfst_socketutil.dir/SocketUtil.cpp.o.requires

.PHONY : quic/common/CMakeFiles/mvfst_socketutil.dir/requires

quic/common/CMakeFiles/mvfst_socketutil.dir/clean:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_socketutil.dir/cmake_clean.cmake
.PHONY : quic/common/CMakeFiles/mvfst_socketutil.dir/clean

quic/common/CMakeFiles/mvfst_socketutil.dir/depend:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/proxygen/proxygen/_build/deps/mvfst /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/common /usr/src/proxygen/proxygen/_build/deps/mvfst/build /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/common/CMakeFiles/mvfst_socketutil.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/common/CMakeFiles/mvfst_socketutil.dir/depend

