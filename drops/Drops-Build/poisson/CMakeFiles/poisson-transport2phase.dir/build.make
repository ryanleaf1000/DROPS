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
include poisson/CMakeFiles/poisson-transport2phase.dir/depend.make

# Include the progress variables for this target.
include poisson/CMakeFiles/poisson-transport2phase.dir/progress.make

# Include the compile flags for this target's objects.
include poisson/CMakeFiles/poisson-transport2phase.dir/flags.make

poisson/CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.o: poisson/CMakeFiles/poisson-transport2phase.dir/flags.make
poisson/CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.o: /home/qi/Drops/drops/drops/src/poisson/transport2phase.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object poisson/CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/poisson && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.o -c /home/qi/Drops/drops/drops/src/poisson/transport2phase.cpp

poisson/CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/poisson && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/poisson/transport2phase.cpp > CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.i

poisson/CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/poisson && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/poisson/transport2phase.cpp -o CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.s

# Object files for target poisson-transport2phase
poisson__transport2phase_OBJECTS = \
"CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.o"

# External object files for target poisson-transport2phase
poisson__transport2phase_EXTERNAL_OBJECTS =

poisson/libpoisson-transport2phase.a: poisson/CMakeFiles/poisson-transport2phase.dir/transport2phase.cpp.o
poisson/libpoisson-transport2phase.a: poisson/CMakeFiles/poisson-transport2phase.dir/build.make
poisson/libpoisson-transport2phase.a: poisson/CMakeFiles/poisson-transport2phase.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libpoisson-transport2phase.a"
	cd /home/qi/Drops/drops/Drops-Build/poisson && $(CMAKE_COMMAND) -P CMakeFiles/poisson-transport2phase.dir/cmake_clean_target.cmake
	cd /home/qi/Drops/drops/Drops-Build/poisson && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/poisson-transport2phase.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
poisson/CMakeFiles/poisson-transport2phase.dir/build: poisson/libpoisson-transport2phase.a

.PHONY : poisson/CMakeFiles/poisson-transport2phase.dir/build

poisson/CMakeFiles/poisson-transport2phase.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/poisson && $(CMAKE_COMMAND) -P CMakeFiles/poisson-transport2phase.dir/cmake_clean.cmake
.PHONY : poisson/CMakeFiles/poisson-transport2phase.dir/clean

poisson/CMakeFiles/poisson-transport2phase.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/poisson /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/poisson /home/qi/Drops/drops/Drops-Build/poisson/CMakeFiles/poisson-transport2phase.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : poisson/CMakeFiles/poisson-transport2phase.dir/depend

