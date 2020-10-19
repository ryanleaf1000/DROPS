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

# Utility rule file for separation-coeffs.

# Include the progress variables for this target.
include surfphasesep/CMakeFiles/separation-coeffs.dir/progress.make

surfphasesep/CMakeFiles/separation-coeffs: misc/libmisc-scalarFunctions.so
surfphasesep/CMakeFiles/separation-coeffs: misc/libmisc-vectorFunctions.so
surfphasesep/CMakeFiles/separation-coeffs: levelset/liblevelset-twophaseCoeff.so
surfphasesep/CMakeFiles/separation-coeffs: levelset/liblevelset-filmCoeff.so
surfphasesep/CMakeFiles/separation-coeffs: poisson/libpoisson-poissonCoeff.so
surfphasesep/CMakeFiles/separation-coeffs: stokes/libstokes-stokesCoeff.so


separation-coeffs: surfphasesep/CMakeFiles/separation-coeffs
separation-coeffs: surfphasesep/CMakeFiles/separation-coeffs.dir/build.make

.PHONY : separation-coeffs

# Rule to build all files generated by this target.
surfphasesep/CMakeFiles/separation-coeffs.dir/build: separation-coeffs

.PHONY : surfphasesep/CMakeFiles/separation-coeffs.dir/build

surfphasesep/CMakeFiles/separation-coeffs.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/surfphasesep && $(CMAKE_COMMAND) -P CMakeFiles/separation-coeffs.dir/cmake_clean.cmake
.PHONY : surfphasesep/CMakeFiles/separation-coeffs.dir/clean

surfphasesep/CMakeFiles/separation-coeffs.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/surfphasesep /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/surfphasesep /home/qi/Drops/drops/Drops-Build/surfphasesep/CMakeFiles/separation-coeffs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : surfphasesep/CMakeFiles/separation-coeffs.dir/depend
