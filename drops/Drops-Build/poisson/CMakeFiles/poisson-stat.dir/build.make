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

# Utility rule file for poisson-stat.

# Include the progress variables for this target.
include poisson/CMakeFiles/poisson-stat.dir/progress.make

poisson/CMakeFiles/poisson-stat:
	cd /home/qi/Drops/drops/drops/src/poisson && ls /home/qi/Drops/drops/drops/src/poisson/*.cpp /home/qi/Drops/drops/drops/src/poisson/*.tpp /home/qi/Drops/drops/drops/src/poisson/*.h | xargs wc -l

poisson-stat: poisson/CMakeFiles/poisson-stat
poisson-stat: poisson/CMakeFiles/poisson-stat.dir/build.make

.PHONY : poisson-stat

# Rule to build all files generated by this target.
poisson/CMakeFiles/poisson-stat.dir/build: poisson-stat

.PHONY : poisson/CMakeFiles/poisson-stat.dir/build

poisson/CMakeFiles/poisson-stat.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/poisson && $(CMAKE_COMMAND) -P CMakeFiles/poisson-stat.dir/cmake_clean.cmake
.PHONY : poisson/CMakeFiles/poisson-stat.dir/clean

poisson/CMakeFiles/poisson-stat.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/poisson /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/poisson /home/qi/Drops/drops/Drops-Build/poisson/CMakeFiles/poisson-stat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : poisson/CMakeFiles/poisson-stat.dir/depend
