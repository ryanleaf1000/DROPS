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
include poisson/CMakeFiles/cdrdrops.dir/depend.make

# Include the progress variables for this target.
include poisson/CMakeFiles/cdrdrops.dir/progress.make

# Include the compile flags for this target's objects.
include poisson/CMakeFiles/cdrdrops.dir/flags.make

poisson/CMakeFiles/cdrdrops.dir/cdrdrops.cpp.o: poisson/CMakeFiles/cdrdrops.dir/flags.make
poisson/CMakeFiles/cdrdrops.dir/cdrdrops.cpp.o: /home/qi/Drops/drops/drops/src/poisson/cdrdrops.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object poisson/CMakeFiles/cdrdrops.dir/cdrdrops.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/poisson && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cdrdrops.dir/cdrdrops.cpp.o -c /home/qi/Drops/drops/drops/src/poisson/cdrdrops.cpp

poisson/CMakeFiles/cdrdrops.dir/cdrdrops.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cdrdrops.dir/cdrdrops.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/poisson && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/poisson/cdrdrops.cpp > CMakeFiles/cdrdrops.dir/cdrdrops.cpp.i

poisson/CMakeFiles/cdrdrops.dir/cdrdrops.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cdrdrops.dir/cdrdrops.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/poisson && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/poisson/cdrdrops.cpp -o CMakeFiles/cdrdrops.dir/cdrdrops.cpp.s

# Object files for target cdrdrops
cdrdrops_OBJECTS = \
"CMakeFiles/cdrdrops.dir/cdrdrops.cpp.o"

# External object files for target cdrdrops
cdrdrops_EXTERNAL_OBJECTS =

poisson/cdrdrops: poisson/CMakeFiles/cdrdrops.dir/cdrdrops.cpp.o
poisson/cdrdrops: poisson/CMakeFiles/cdrdrops.dir/build.make
poisson/cdrdrops: poisson/libpoisson-ale.a
poisson/cdrdrops: geom/libgeom-boundary.a
poisson/cdrdrops: geom/libgeom-builder.a
poisson/cdrdrops: out/libout-ensightOut.a
poisson/cdrdrops: geom/libgeom-simplex.a
poisson/cdrdrops: geom/libgeom-multigrid.a
poisson/cdrdrops: num/libnum-unknowns.a
poisson/cdrdrops: geom/libgeom-topo.a
poisson/cdrdrops: poisson/libpoisson-poisson.a
poisson/cdrdrops: misc/libmisc-problem.a
poisson/cdrdrops: misc/libmisc-progressaccu.a
poisson/cdrdrops: misc/libmisc-utils.a
poisson/cdrdrops: out/libout-output.a
poisson/cdrdrops: num/libnum-fe.a
poisson/cdrdrops: num/libnum-discretize.a
poisson/cdrdrops: num/libnum-interfacePatch.a
poisson/cdrdrops: geom/libgeom-geomselect.a
poisson/cdrdrops: misc/libmisc-params.a
poisson/cdrdrops: out/libout-vtkOut.a
poisson/cdrdrops: misc/libmisc-funcmap.a
poisson/cdrdrops: geom/libgeom-deformation.a
poisson/cdrdrops: misc/libmisc-scopetimer.a
poisson/cdrdrops: poisson/libpoisson-poissonParam.a
poisson/cdrdrops: misc/libmisc-dynamicload.a
poisson/cdrdrops: geom/libgeom-simplex.a
poisson/cdrdrops: num/libnum-unknowns.a
poisson/cdrdrops: geom/libgeom-deformation.a
poisson/cdrdrops: misc/libmisc-problem.a
poisson/cdrdrops: num/libnum-interfacePatch.a
poisson/cdrdrops: num/libnum-discretize.a
poisson/cdrdrops: num/libnum-fe.a
poisson/cdrdrops: geom/libgeom-principallattice.a
poisson/cdrdrops: geom/libgeom-subtriangulation.a
poisson/cdrdrops: geom/libgeom-reftetracut.a
poisson/cdrdrops: num/libnum-bndData.a
poisson/cdrdrops: geom/libgeom-builder.a
poisson/cdrdrops: geom/libgeom-boundary.a
poisson/cdrdrops: misc/libmisc-params.a
poisson/cdrdrops: misc/libmisc-utils.a
poisson/cdrdrops: misc/libmisc-base64.a
poisson/cdrdrops: poisson/CMakeFiles/cdrdrops.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable cdrdrops"
	cd /home/qi/Drops/drops/Drops-Build/poisson && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cdrdrops.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
poisson/CMakeFiles/cdrdrops.dir/build: poisson/cdrdrops

.PHONY : poisson/CMakeFiles/cdrdrops.dir/build

poisson/CMakeFiles/cdrdrops.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/poisson && $(CMAKE_COMMAND) -P CMakeFiles/cdrdrops.dir/cmake_clean.cmake
.PHONY : poisson/CMakeFiles/cdrdrops.dir/clean

poisson/CMakeFiles/cdrdrops.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/poisson /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/poisson /home/qi/Drops/drops/Drops-Build/poisson/CMakeFiles/cdrdrops.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : poisson/CMakeFiles/cdrdrops.dir/depend

