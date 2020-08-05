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
include geom/CMakeFiles/geom-multigrid.dir/depend.make

# Include the progress variables for this target.
include geom/CMakeFiles/geom-multigrid.dir/progress.make

# Include the compile flags for this target's objects.
include geom/CMakeFiles/geom-multigrid.dir/flags.make

geom/CMakeFiles/geom-multigrid.dir/multigrid.cpp.o: geom/CMakeFiles/geom-multigrid.dir/flags.make
geom/CMakeFiles/geom-multigrid.dir/multigrid.cpp.o: /home/qi/Drops/drops/drops/src/geom/multigrid.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object geom/CMakeFiles/geom-multigrid.dir/multigrid.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/geom && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/geom-multigrid.dir/multigrid.cpp.o -c /home/qi/Drops/drops/drops/src/geom/multigrid.cpp

geom/CMakeFiles/geom-multigrid.dir/multigrid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/geom-multigrid.dir/multigrid.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/geom && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/geom/multigrid.cpp > CMakeFiles/geom-multigrid.dir/multigrid.cpp.i

geom/CMakeFiles/geom-multigrid.dir/multigrid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/geom-multigrid.dir/multigrid.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/geom && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/geom/multigrid.cpp -o CMakeFiles/geom-multigrid.dir/multigrid.cpp.s

# Object files for target geom-multigrid
geom__multigrid_OBJECTS = \
"CMakeFiles/geom-multigrid.dir/multigrid.cpp.o"

# External object files for target geom-multigrid
geom__multigrid_EXTERNAL_OBJECTS =

geom/libgeom-multigrid.a: geom/CMakeFiles/geom-multigrid.dir/multigrid.cpp.o
geom/libgeom-multigrid.a: geom/CMakeFiles/geom-multigrid.dir/build.make
geom/libgeom-multigrid.a: geom/CMakeFiles/geom-multigrid.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libgeom-multigrid.a"
	cd /home/qi/Drops/drops/Drops-Build/geom && $(CMAKE_COMMAND) -P CMakeFiles/geom-multigrid.dir/cmake_clean_target.cmake
	cd /home/qi/Drops/drops/Drops-Build/geom && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/geom-multigrid.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
geom/CMakeFiles/geom-multigrid.dir/build: geom/libgeom-multigrid.a

.PHONY : geom/CMakeFiles/geom-multigrid.dir/build

geom/CMakeFiles/geom-multigrid.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/geom && $(CMAKE_COMMAND) -P CMakeFiles/geom-multigrid.dir/cmake_clean.cmake
.PHONY : geom/CMakeFiles/geom-multigrid.dir/clean

geom/CMakeFiles/geom-multigrid.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/geom /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/geom /home/qi/Drops/drops/Drops-Build/geom/CMakeFiles/geom-multigrid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : geom/CMakeFiles/geom-multigrid.dir/depend

