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
include transport/CMakeFiles/ns_transp.dir/depend.make

# Include the progress variables for this target.
include transport/CMakeFiles/ns_transp.dir/progress.make

# Include the compile flags for this target's objects.
include transport/CMakeFiles/ns_transp.dir/flags.make

transport/CMakeFiles/ns_transp.dir/ns_transp.cpp.o: transport/CMakeFiles/ns_transp.dir/flags.make
transport/CMakeFiles/ns_transp.dir/ns_transp.cpp.o: /home/qi/Drops/drops/drops/src/transport/ns_transp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object transport/CMakeFiles/ns_transp.dir/ns_transp.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/transport && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ns_transp.dir/ns_transp.cpp.o -c /home/qi/Drops/drops/drops/src/transport/ns_transp.cpp

transport/CMakeFiles/ns_transp.dir/ns_transp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ns_transp.dir/ns_transp.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/transport && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/transport/ns_transp.cpp > CMakeFiles/ns_transp.dir/ns_transp.cpp.i

transport/CMakeFiles/ns_transp.dir/ns_transp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ns_transp.dir/ns_transp.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/transport && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/transport/ns_transp.cpp -o CMakeFiles/ns_transp.dir/ns_transp.cpp.s

# Object files for target ns_transp
ns_transp_OBJECTS = \
"CMakeFiles/ns_transp.dir/ns_transp.cpp.o"

# External object files for target ns_transp
ns_transp_EXTERNAL_OBJECTS =

transport/ns_transp: transport/CMakeFiles/ns_transp.dir/ns_transp.cpp.o
transport/ns_transp: transport/CMakeFiles/ns_transp.dir/build.make
transport/ns_transp: transport/libtransport-transportCoeff.so
transport/ns_transp: geom/libgeom-boundary.a
transport/ns_transp: geom/libgeom-builder.a
transport/ns_transp: geom/libgeom-multigrid.a
transport/ns_transp: geom/libgeom-deformation.a
transport/ns_transp: num/libnum-unknowns.a
transport/ns_transp: geom/libgeom-topo.a
transport/ns_transp: num/libnum-fe.a
transport/ns_transp: misc/libmisc-problem.a
transport/ns_transp: levelset/liblevelset-levelset.a
transport/ns_transp: levelset/liblevelset-adaptriang.a
transport/ns_transp: levelset/liblevelset-marking_strategy.a
transport/ns_transp: misc/libmisc-scopetimer.a
transport/ns_transp: misc/libmisc-progressaccu.a
transport/ns_transp: misc/libmisc-utils.a
transport/ns_transp: out/libout-output.a
transport/ns_transp: num/libnum-discretize.a
transport/ns_transp: navstokes/libnavstokes-instatnavstokes2phase.a
transport/ns_transp: misc/libmisc-scalarFunctions.so
transport/ns_transp: misc/libmisc-vectorFunctions.so
transport/ns_transp: misc/libmisc-funcmap.a
transport/ns_transp: misc/libmisc-params.a
transport/ns_transp: levelset/liblevelset-fastmarch.a
transport/ns_transp: stokes/libstokes-instatstokes2phase.a
transport/ns_transp: num/libnum-MGsolver.a
transport/ns_transp: num/libnum-fe.a
transport/ns_transp: out/libout-ensightOut.a
transport/ns_transp: transport/libtransport-transportNitsche.a
transport/ns_transp: num/libnum-interfacePatch.a
transport/ns_transp: levelset/liblevelset-fastmarch.a
transport/ns_transp: num/libnum-fe.a
transport/ns_transp: out/libout-vtkOut.a
transport/ns_transp: levelset/liblevelset-surfacetension.a
transport/ns_transp: geom/libgeom-simplex.a
transport/ns_transp: surfactant/libsurfactant-ifacetransp.a
transport/ns_transp: geom/libgeom-geomselect.a
transport/ns_transp: levelset/liblevelset-twophaseutils.a
transport/ns_transp: num/libnum-hypre.a
transport/ns_transp: levelset/liblevelset-coupling.a
transport/ns_transp: geom/libgeom-principallattice.a
transport/ns_transp: geom/libgeom-reftetracut.a
transport/ns_transp: geom/libgeom-subtriangulation.a
transport/ns_transp: num/libnum-quadrature.a
transport/ns_transp: num/libnum-renumber.a
transport/ns_transp: num/libnum-oseenprecond.a
transport/ns_transp: misc/libmisc-dynamicload.a
transport/ns_transp: stokes/libstokes-slipBndOnePhase.a
transport/ns_transp: num/libnum-bndData.a
transport/ns_transp: levelset/liblevelset-volume_adjustment.a
transport/ns_transp: out/libout-vtkOut.a
transport/ns_transp: misc/libmisc-base64.a
transport/ns_transp: levelset/liblevelset-levelsetmapper.a
transport/ns_transp: geom/libgeom-locator.a
transport/ns_transp: geom/libgeom-simplex.a
transport/ns_transp: geom/libgeom-deformation.a
transport/ns_transp: misc/libmisc-problem.a
transport/ns_transp: num/libnum-interfacePatch.a
transport/ns_transp: num/libnum-discretize.a
transport/ns_transp: num/libnum-fe.a
transport/ns_transp: geom/libgeom-principallattice.a
transport/ns_transp: geom/libgeom-subtriangulation.a
transport/ns_transp: geom/libgeom-reftetracut.a
transport/ns_transp: num/libnum-unknowns.a
transport/ns_transp: geom/libgeom-builder.a
transport/ns_transp: geom/libgeom-boundary.a
transport/ns_transp: misc/libmisc-utils.a
transport/ns_transp: misc/libmisc-params.a
transport/ns_transp: transport/CMakeFiles/ns_transp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ns_transp"
	cd /home/qi/Drops/drops/Drops-Build/transport && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ns_transp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
transport/CMakeFiles/ns_transp.dir/build: transport/ns_transp

.PHONY : transport/CMakeFiles/ns_transp.dir/build

transport/CMakeFiles/ns_transp.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/transport && $(CMAKE_COMMAND) -P CMakeFiles/ns_transp.dir/cmake_clean.cmake
.PHONY : transport/CMakeFiles/ns_transp.dir/clean

transport/CMakeFiles/ns_transp.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/transport /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/transport /home/qi/Drops/drops/Drops-Build/transport/CMakeFiles/ns_transp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : transport/CMakeFiles/ns_transp.dir/depend
