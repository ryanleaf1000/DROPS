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

# Utility rule file for parallel-coeffs.

# Include the progress variables for this target.
include parallel/CMakeFiles/parallel-coeffs.dir/progress.make

parallel/CMakeFiles/parallel-coeffs: misc/libmisc-scalarFunctions.so
parallel/CMakeFiles/parallel-coeffs: misc/libmisc-vectorFunctions.so
parallel/CMakeFiles/parallel-coeffs: levelset/liblevelset-twophaseCoeff.so
parallel/CMakeFiles/parallel-coeffs: levelset/liblevelset-filmCoeff.so
parallel/CMakeFiles/parallel-coeffs: poisson/libpoisson-poissonCoeff.so
parallel/CMakeFiles/parallel-coeffs: stokes/libstokes-stokesCoeff.so


parallel-coeffs: parallel/CMakeFiles/parallel-coeffs
parallel-coeffs: parallel/CMakeFiles/parallel-coeffs.dir/build.make

.PHONY : parallel-coeffs

# Rule to build all files generated by this target.
parallel/CMakeFiles/parallel-coeffs.dir/build: parallel-coeffs

.PHONY : parallel/CMakeFiles/parallel-coeffs.dir/build

parallel/CMakeFiles/parallel-coeffs.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/parallel && $(CMAKE_COMMAND) -P CMakeFiles/parallel-coeffs.dir/cmake_clean.cmake
.PHONY : parallel/CMakeFiles/parallel-coeffs.dir/clean

parallel/CMakeFiles/parallel-coeffs.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/parallel /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/parallel /home/qi/Drops/drops/Drops-Build/parallel/CMakeFiles/parallel-coeffs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : parallel/CMakeFiles/parallel-coeffs.dir/depend
