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
include tests/CMakeFiles/quadCut.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/quadCut.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/quadCut.dir/flags.make

tests/CMakeFiles/quadCut.dir/quadCut.cpp.o: tests/CMakeFiles/quadCut.dir/flags.make
tests/CMakeFiles/quadCut.dir/quadCut.cpp.o: /home/qi/Drops/drops/drops/src/tests/quadCut.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/quadCut.dir/quadCut.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/quadCut.dir/quadCut.cpp.o -c /home/qi/Drops/drops/drops/src/tests/quadCut.cpp

tests/CMakeFiles/quadCut.dir/quadCut.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/quadCut.dir/quadCut.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/tests/quadCut.cpp > CMakeFiles/quadCut.dir/quadCut.cpp.i

tests/CMakeFiles/quadCut.dir/quadCut.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/quadCut.dir/quadCut.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/tests/quadCut.cpp -o CMakeFiles/quadCut.dir/quadCut.cpp.s

# Object files for target quadCut
quadCut_OBJECTS = \
"CMakeFiles/quadCut.dir/quadCut.cpp.o"

# External object files for target quadCut
quadCut_EXTERNAL_OBJECTS =

tests/quadCut: tests/CMakeFiles/quadCut.dir/quadCut.cpp.o
tests/quadCut: tests/CMakeFiles/quadCut.dir/build.make
tests/quadCut: misc/libmisc-utils.a
tests/quadCut: geom/libgeom-builder.a
tests/quadCut: geom/libgeom-deformation.a
tests/quadCut: geom/libgeom-simplex.a
tests/quadCut: geom/libgeom-multigrid.a
tests/quadCut: misc/libmisc-scopetimer.a
tests/quadCut: misc/libmisc-progressaccu.a
tests/quadCut: geom/libgeom-boundary.a
tests/quadCut: geom/libgeom-topo.a
tests/quadCut: num/libnum-unknowns.a
tests/quadCut: misc/libmisc-problem.a
tests/quadCut: num/libnum-interfacePatch.a
tests/quadCut: levelset/liblevelset-levelset.a
tests/quadCut: levelset/liblevelset-fastmarch.a
tests/quadCut: num/libnum-discretize.a
tests/quadCut: num/libnum-fe.a
tests/quadCut: levelset/liblevelset-surfacetension.a
tests/quadCut: geom/libgeom-principallattice.a
tests/quadCut: geom/libgeom-reftetracut.a
tests/quadCut: geom/libgeom-subtriangulation.a
tests/quadCut: num/libnum-quadrature.a
tests/quadCut: num/libnum-bndData.a
tests/quadCut: misc/libmisc-params.a
tests/quadCut: misc/libmisc-scopetimer.a
tests/quadCut: misc/libmisc-progressaccu.a
tests/quadCut: levelset/liblevelset-volume_adjustment.a
tests/quadCut: out/libout-vtkOut.a
tests/quadCut: misc/libmisc-base64.a
tests/quadCut: geom/libgeom-locator.a
tests/quadCut: geom/libgeom-simplex.a
tests/quadCut: geom/libgeom-deformation.a
tests/quadCut: misc/libmisc-problem.a
tests/quadCut: num/libnum-interfacePatch.a
tests/quadCut: misc/libmisc-utils.a
tests/quadCut: num/libnum-discretize.a
tests/quadCut: num/libnum-fe.a
tests/quadCut: geom/libgeom-principallattice.a
tests/quadCut: geom/libgeom-subtriangulation.a
tests/quadCut: geom/libgeom-reftetracut.a
tests/quadCut: num/libnum-unknowns.a
tests/quadCut: tests/CMakeFiles/quadCut.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable quadCut"
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/quadCut.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/quadCut.dir/build: tests/quadCut

.PHONY : tests/CMakeFiles/quadCut.dir/build

tests/CMakeFiles/quadCut.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -P CMakeFiles/quadCut.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/quadCut.dir/clean

tests/CMakeFiles/quadCut.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/tests /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/tests /home/qi/Drops/drops/Drops-Build/tests/CMakeFiles/quadCut.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/quadCut.dir/depend
