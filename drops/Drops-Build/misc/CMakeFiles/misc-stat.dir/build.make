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

# Utility rule file for misc-stat.

# Include the progress variables for this target.
include misc/CMakeFiles/misc-stat.dir/progress.make

misc/CMakeFiles/misc-stat:
	cd /home/qi/Drops/drops/drops/src/misc && ls /home/qi/Drops/drops/drops/src/misc/*.cpp /home/qi/Drops/drops/drops/src/misc/*.tpp /home/qi/Drops/drops/drops/src/misc/*.h | xargs wc -l

misc-stat: misc/CMakeFiles/misc-stat
misc-stat: misc/CMakeFiles/misc-stat.dir/build.make

.PHONY : misc-stat

# Rule to build all files generated by this target.
misc/CMakeFiles/misc-stat.dir/build: misc-stat

.PHONY : misc/CMakeFiles/misc-stat.dir/build

misc/CMakeFiles/misc-stat.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/misc && $(CMAKE_COMMAND) -P CMakeFiles/misc-stat.dir/cmake_clean.cmake
.PHONY : misc/CMakeFiles/misc-stat.dir/clean

misc/CMakeFiles/misc-stat.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/misc /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/misc /home/qi/Drops/drops/Drops-Build/misc/CMakeFiles/misc-stat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : misc/CMakeFiles/misc-stat.dir/depend

