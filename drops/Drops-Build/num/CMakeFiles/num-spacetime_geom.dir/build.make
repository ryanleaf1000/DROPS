# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /opt/clion-2020.1.2/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /opt/clion-2020.1.2/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/qi/Drops/drops/drops/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/qi/Drops/drops/Drops-Build

# Include any dependencies generated for this target.
include num/CMakeFiles/num-spacetime_geom.dir/depend.make

# Include the progress variables for this target.
include num/CMakeFiles/num-spacetime_geom.dir/progress.make

# Include the compile flags for this target's objects.
include num/CMakeFiles/num-spacetime_geom.dir/flags.make

num/CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.o: num/CMakeFiles/num-spacetime_geom.dir/flags.make
num/CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.o: /home/qi/Drops/drops/drops/src/num/spacetime_geom.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object num/CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/num && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.o -c /home/qi/Drops/drops/drops/src/num/spacetime_geom.cpp

num/CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/num && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/num/spacetime_geom.cpp > CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.i

num/CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/num && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/num/spacetime_geom.cpp -o CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.s

# Object files for target num-spacetime_geom
num__spacetime_geom_OBJECTS = \
"CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.o"

# External object files for target num-spacetime_geom
num__spacetime_geom_EXTERNAL_OBJECTS =

num/libnum-spacetime_geom.a: num/CMakeFiles/num-spacetime_geom.dir/spacetime_geom.cpp.o
num/libnum-spacetime_geom.a: num/CMakeFiles/num-spacetime_geom.dir/build.make
num/libnum-spacetime_geom.a: num/CMakeFiles/num-spacetime_geom.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libnum-spacetime_geom.a"
	cd /home/qi/Drops/drops/Drops-Build/num && $(CMAKE_COMMAND) -P CMakeFiles/num-spacetime_geom.dir/cmake_clean_target.cmake
	cd /home/qi/Drops/drops/Drops-Build/num && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/num-spacetime_geom.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
num/CMakeFiles/num-spacetime_geom.dir/build: num/libnum-spacetime_geom.a

.PHONY : num/CMakeFiles/num-spacetime_geom.dir/build

num/CMakeFiles/num-spacetime_geom.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/num && $(CMAKE_COMMAND) -P CMakeFiles/num-spacetime_geom.dir/cmake_clean.cmake
.PHONY : num/CMakeFiles/num-spacetime_geom.dir/clean

num/CMakeFiles/num-spacetime_geom.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/num /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/num /home/qi/Drops/drops/Drops-Build/num/CMakeFiles/num-spacetime_geom.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : num/CMakeFiles/num-spacetime_geom.dir/depend

