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
include num/CMakeFiles/num-stokespardiso.dir/depend.make

# Include the progress variables for this target.
include num/CMakeFiles/num-stokespardiso.dir/progress.make

# Include the compile flags for this target's objects.
include num/CMakeFiles/num-stokespardiso.dir/flags.make

num/CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.o: num/CMakeFiles/num-stokespardiso.dir/flags.make
num/CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.o: /home/qi/Drops/drops/drops/src/num/stokespardiso.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object num/CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/num && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.o -c /home/qi/Drops/drops/drops/src/num/stokespardiso.cpp

num/CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/num && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/num/stokespardiso.cpp > CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.i

num/CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/num && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/num/stokespardiso.cpp -o CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.s

# Object files for target num-stokespardiso
num__stokespardiso_OBJECTS = \
"CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.o"

# External object files for target num-stokespardiso
num__stokespardiso_EXTERNAL_OBJECTS =

num/libnum-stokespardiso.a: num/CMakeFiles/num-stokespardiso.dir/stokespardiso.cpp.o
num/libnum-stokespardiso.a: num/CMakeFiles/num-stokespardiso.dir/build.make
num/libnum-stokespardiso.a: num/CMakeFiles/num-stokespardiso.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libnum-stokespardiso.a"
	cd /home/qi/Drops/drops/Drops-Build/num && $(CMAKE_COMMAND) -P CMakeFiles/num-stokespardiso.dir/cmake_clean_target.cmake
	cd /home/qi/Drops/drops/Drops-Build/num && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/num-stokespardiso.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
num/CMakeFiles/num-stokespardiso.dir/build: num/libnum-stokespardiso.a

.PHONY : num/CMakeFiles/num-stokespardiso.dir/build

num/CMakeFiles/num-stokespardiso.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/num && $(CMAKE_COMMAND) -P CMakeFiles/num-stokespardiso.dir/cmake_clean.cmake
.PHONY : num/CMakeFiles/num-stokespardiso.dir/clean

num/CMakeFiles/num-stokespardiso.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/num /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/num /home/qi/Drops/drops/Drops-Build/num/CMakeFiles/num-stokespardiso.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : num/CMakeFiles/num-stokespardiso.dir/depend

