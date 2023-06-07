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
include quic/loss/CMakeFiles/mvfst_loss.dir/depend.make

# Include the progress variables for this target.
include quic/loss/CMakeFiles/mvfst_loss.dir/progress.make

# Include the compile flags for this target's objects.
include quic/loss/CMakeFiles/mvfst_loss.dir/flags.make

quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o: quic/loss/CMakeFiles/mvfst_loss.dir/flags.make
quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o: ../quic/loss/QuicLossFunctions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o -c /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/loss/QuicLossFunctions.cpp

quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.i"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/loss/QuicLossFunctions.cpp > CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.i

quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.s"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/loss/QuicLossFunctions.cpp -o CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.s

quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.requires:

.PHONY : quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.requires

quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.provides: quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.requires
	$(MAKE) -f quic/loss/CMakeFiles/mvfst_loss.dir/build.make quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.provides.build
.PHONY : quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.provides

quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.provides.build: quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o


# Object files for target mvfst_loss
mvfst_loss_OBJECTS = \
"CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o"

# External object files for target mvfst_loss
mvfst_loss_EXTERNAL_OBJECTS =

quic/loss/libmvfst_loss.a: quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o
quic/loss/libmvfst_loss.a: quic/loss/CMakeFiles/mvfst_loss.dir/build.make
quic/loss/libmvfst_loss.a: quic/loss/CMakeFiles/mvfst_loss.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/usr/src/proxygen/proxygen/_build/deps/mvfst/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libmvfst_loss.a"
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_loss.dir/cmake_clean_target.cmake
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_loss.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/loss/CMakeFiles/mvfst_loss.dir/build: quic/loss/libmvfst_loss.a

.PHONY : quic/loss/CMakeFiles/mvfst_loss.dir/build

quic/loss/CMakeFiles/mvfst_loss.dir/requires: quic/loss/CMakeFiles/mvfst_loss.dir/QuicLossFunctions.cpp.o.requires

.PHONY : quic/loss/CMakeFiles/mvfst_loss.dir/requires

quic/loss/CMakeFiles/mvfst_loss.dir/clean:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_loss.dir/cmake_clean.cmake
.PHONY : quic/loss/CMakeFiles/mvfst_loss.dir/clean

quic/loss/CMakeFiles/mvfst_loss.dir/depend:
	cd /usr/src/proxygen/proxygen/_build/deps/mvfst/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr/src/proxygen/proxygen/_build/deps/mvfst /usr/src/proxygen/proxygen/_build/deps/mvfst/quic/loss /usr/src/proxygen/proxygen/_build/deps/mvfst/build /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss /usr/src/proxygen/proxygen/_build/deps/mvfst/build/quic/loss/CMakeFiles/mvfst_loss.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/loss/CMakeFiles/mvfst_loss.dir/depend

