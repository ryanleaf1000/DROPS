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

# Utility rule file for num-stat.

# Include the progress variables for this target.
include num/CMakeFiles/num-stat.dir/progress.make

num/CMakeFiles/num-stat:
	cd /home/qi/Drops/drops/drops/src/num && ls /home/qi/Drops/drops/drops/src/num/*.cpp /home/qi/Drops/drops/drops/src/num/*.tpp /home/qi/Drops/drops/drops/src/num/*.h | xargs wc -l

num-stat: num/CMakeFiles/num-stat
num-stat: num/CMakeFiles/num-stat.dir/build.make

.PHONY : num-stat

# Rule to build all files generated by this target.
num/CMakeFiles/num-stat.dir/build: num-stat

.PHONY : num/CMakeFiles/num-stat.dir/build

num/CMakeFiles/num-stat.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/num && $(CMAKE_COMMAND) -P CMakeFiles/num-stat.dir/cmake_clean.cmake
.PHONY : num/CMakeFiles/num-stat.dir/clean

num/CMakeFiles/num-stat.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/num /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/num /home/qi/Drops/drops/Drops-Build/num/CMakeFiles/num-stat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : num/CMakeFiles/num-stat.dir/depend

