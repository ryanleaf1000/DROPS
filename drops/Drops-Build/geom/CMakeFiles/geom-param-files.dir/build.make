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

# Utility rule file for geom-param-files.

# Include the progress variables for this target.
include geom/CMakeFiles/geom-param-files.dir/progress.make

geom/CMakeFiles/geom-param-files:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "copy param files from /home/qi/Drops/drops/drops/src/geom/ to /home/qi/Drops/drops/Drops-Build/geom/"
	cd /home/qi/Drops/drops/Drops-Build/geom && echo "copy $f json files..." ; cp -f /home/qi/Drops/drops/drops/src/geom/*.json /home/qi/Drops/drops/Drops-Build/geom/ 2> /dev/null ;

geom-param-files: geom/CMakeFiles/geom-param-files
geom-param-files: geom/CMakeFiles/geom-param-files.dir/build.make

.PHONY : geom-param-files

# Rule to build all files generated by this target.
geom/CMakeFiles/geom-param-files.dir/build: geom-param-files

.PHONY : geom/CMakeFiles/geom-param-files.dir/build

geom/CMakeFiles/geom-param-files.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/geom && $(CMAKE_COMMAND) -P CMakeFiles/geom-param-files.dir/cmake_clean.cmake
.PHONY : geom/CMakeFiles/geom-param-files.dir/clean

geom/CMakeFiles/geom-param-files.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/geom /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/geom /home/qi/Drops/drops/Drops-Build/geom/CMakeFiles/geom-param-files.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : geom/CMakeFiles/geom-param-files.dir/depend

