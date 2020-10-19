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
include tests/CMakeFiles/quad5_2D.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/quad5_2D.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/quad5_2D.dir/flags.make

tests/CMakeFiles/quad5_2D.dir/quad5_2D.cpp.o: tests/CMakeFiles/quad5_2D.dir/flags.make
tests/CMakeFiles/quad5_2D.dir/quad5_2D.cpp.o: /home/qi/Drops/drops/drops/src/tests/quad5_2D.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/quad5_2D.dir/quad5_2D.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/quad5_2D.dir/quad5_2D.cpp.o -c /home/qi/Drops/drops/drops/src/tests/quad5_2D.cpp

tests/CMakeFiles/quad5_2D.dir/quad5_2D.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/quad5_2D.dir/quad5_2D.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/tests/quad5_2D.cpp > CMakeFiles/quad5_2D.dir/quad5_2D.cpp.i

tests/CMakeFiles/quad5_2D.dir/quad5_2D.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/quad5_2D.dir/quad5_2D.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/tests/quad5_2D.cpp -o CMakeFiles/quad5_2D.dir/quad5_2D.cpp.s

# Object files for target quad5_2D
quad5_2D_OBJECTS = \
"CMakeFiles/quad5_2D.dir/quad5_2D.cpp.o"

# External object files for target quad5_2D
quad5_2D_EXTERNAL_OBJECTS =

tests/quad5_2D: tests/CMakeFiles/quad5_2D.dir/quad5_2D.cpp.o
tests/quad5_2D: tests/CMakeFiles/quad5_2D.dir/build.make
tests/quad5_2D: misc/libmisc-utils.a
tests/quad5_2D: geom/libgeom-boundary.a
tests/quad5_2D: geom/libgeom-builder.a
tests/quad5_2D: geom/libgeom-deformation.a
tests/quad5_2D: geom/libgeom-multigrid.a
tests/quad5_2D: geom/libgeom-principallattice.a
tests/quad5_2D: geom/libgeom-reftetracut.a
tests/quad5_2D: geom/libgeom-simplex.a
tests/quad5_2D: geom/libgeom-subtriangulation.a
tests/quad5_2D: geom/libgeom-topo.a
tests/quad5_2D: num/libnum-unknowns.a
tests/quad5_2D: misc/libmisc-problem.a
tests/quad5_2D: num/libnum-fe.a
tests/quad5_2D: num/libnum-discretize.a
tests/quad5_2D: num/libnum-interfacePatch.a
tests/quad5_2D: geom/libgeom-boundary.a
tests/quad5_2D: geom/libgeom-deformation.a
tests/quad5_2D: misc/libmisc-problem.a
tests/quad5_2D: geom/libgeom-principallattice.a
tests/quad5_2D: geom/libgeom-subtriangulation.a
tests/quad5_2D: geom/libgeom-reftetracut.a
tests/quad5_2D: num/libnum-interfacePatch.a
tests/quad5_2D: misc/libmisc-utils.a
tests/quad5_2D: num/libnum-discretize.a
tests/quad5_2D: num/libnum-fe.a
tests/quad5_2D: num/libnum-bndData.a
tests/quad5_2D: misc/libmisc-params.a
tests/quad5_2D: tests/CMakeFiles/quad5_2D.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable quad5_2D"
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/quad5_2D.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/quad5_2D.dir/build: tests/quad5_2D

.PHONY : tests/CMakeFiles/quad5_2D.dir/build

tests/CMakeFiles/quad5_2D.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -P CMakeFiles/quad5_2D.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/quad5_2D.dir/clean

tests/CMakeFiles/quad5_2D.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/tests /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/tests /home/qi/Drops/drops/Drops-Build/tests/CMakeFiles/quad5_2D.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/quad5_2D.dir/depend
