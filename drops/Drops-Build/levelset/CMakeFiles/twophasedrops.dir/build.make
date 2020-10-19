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
include levelset/CMakeFiles/twophasedrops.dir/depend.make

# Include the progress variables for this target.
include levelset/CMakeFiles/twophasedrops.dir/progress.make

# Include the compile flags for this target's objects.
include levelset/CMakeFiles/twophasedrops.dir/flags.make

levelset/CMakeFiles/twophasedrops.dir/twophasedrops.cpp.o: levelset/CMakeFiles/twophasedrops.dir/flags.make
levelset/CMakeFiles/twophasedrops.dir/twophasedrops.cpp.o: /home/qi/Drops/drops/drops/src/levelset/twophasedrops.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object levelset/CMakeFiles/twophasedrops.dir/twophasedrops.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/levelset && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/twophasedrops.dir/twophasedrops.cpp.o -c /home/qi/Drops/drops/drops/src/levelset/twophasedrops.cpp

levelset/CMakeFiles/twophasedrops.dir/twophasedrops.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/twophasedrops.dir/twophasedrops.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/levelset && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/levelset/twophasedrops.cpp > CMakeFiles/twophasedrops.dir/twophasedrops.cpp.i

levelset/CMakeFiles/twophasedrops.dir/twophasedrops.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/twophasedrops.dir/twophasedrops.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/levelset && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/levelset/twophasedrops.cpp -o CMakeFiles/twophasedrops.dir/twophasedrops.cpp.s

# Object files for target twophasedrops
twophasedrops_OBJECTS = \
"CMakeFiles/twophasedrops.dir/twophasedrops.cpp.o"

# External object files for target twophasedrops
twophasedrops_EXTERNAL_OBJECTS =

levelset/twophasedrops: levelset/CMakeFiles/twophasedrops.dir/twophasedrops.cpp.o
levelset/twophasedrops: levelset/CMakeFiles/twophasedrops.dir/build.make
levelset/twophasedrops: geom/libgeom-boundary.a
levelset/twophasedrops: geom/libgeom-builder.a
levelset/twophasedrops: geom/libgeom-deformation.a
levelset/twophasedrops: geom/libgeom-simplex.a
levelset/twophasedrops: geom/libgeom-multigrid.a
levelset/twophasedrops: num/libnum-unknowns.a
levelset/twophasedrops: geom/libgeom-topo.a
levelset/twophasedrops: num/libnum-fe.a
levelset/twophasedrops: misc/libmisc-problem.a
levelset/twophasedrops: levelset/liblevelset-levelset.a
levelset/twophasedrops: levelset/liblevelset-adaptriang.a
levelset/twophasedrops: levelset/liblevelset-marking_strategy.a
levelset/twophasedrops: misc/libmisc-progressaccu.a
levelset/twophasedrops: misc/libmisc-scopetimer.a
levelset/twophasedrops: misc/libmisc-utils.a
levelset/twophasedrops: out/libout-output.a
levelset/twophasedrops: num/libnum-discretize.a
levelset/twophasedrops: navstokes/libnavstokes-instatnavstokes2phase.a
levelset/twophasedrops: misc/libmisc-params.a
levelset/twophasedrops: levelset/liblevelset-fastmarch.a
levelset/twophasedrops: stokes/libstokes-instatstokes2phase.a
levelset/twophasedrops: stokes/libstokes-slipBndOnePhase.a
levelset/twophasedrops: num/libnum-MGsolver.a
levelset/twophasedrops: num/libnum-fe.a
levelset/twophasedrops: out/libout-ensightOut.a
levelset/twophasedrops: num/libnum-oseenprecond.a
levelset/twophasedrops: poisson/libpoisson-transport2phase.a
levelset/twophasedrops: num/libnum-interfacePatch.a
levelset/twophasedrops: surfactant/libsurfactant-ifacetransp.a
levelset/twophasedrops: levelset/liblevelset-surfacetension.a
levelset/twophasedrops: geom/libgeom-geomselect.a
levelset/twophasedrops: levelset/liblevelset-twophaseutils.a
levelset/twophasedrops: num/libnum-hypre.a
levelset/twophasedrops: levelset/liblevelset-coupling.a
levelset/twophasedrops: misc/libmisc-funcmap.a
levelset/twophasedrops: geom/libgeom-principallattice.a
levelset/twophasedrops: geom/libgeom-reftetracut.a
levelset/twophasedrops: geom/libgeom-subtriangulation.a
levelset/twophasedrops: num/libnum-renumber.a
levelset/twophasedrops: num/libnum-quadrature.a
levelset/twophasedrops: misc/libmisc-dynamicload.a
levelset/twophasedrops: out/libout-vtkOut.a
levelset/twophasedrops: num/libnum-stokespardiso.a
levelset/twophasedrops: /lib/libifpack2-adapters.so.12.17
levelset/twophasedrops: /lib/libifpack2.so.12.17
levelset/twophasedrops: /lib/libamesos2.so.12.17
levelset/twophasedrops: /lib/libshylu_nodetacho.so.12.17
levelset/twophasedrops: /lib/libshylu_nodehts.so.12.17
levelset/twophasedrops: /lib/libbelosxpetra.so.12.17
levelset/twophasedrops: /lib/libbelostpetra.so.12.17
levelset/twophasedrops: /lib/libbelosepetra.so.12.17
levelset/twophasedrops: /lib/libbelos.so.12.17
levelset/twophasedrops: /lib/libml.so.12.17
levelset/twophasedrops: /lib/libifpack.so.12.17
levelset/twophasedrops: /lib/libzoltan2.so.12.17
levelset/twophasedrops: /lib/libpamgen_extras.so.12.17
levelset/twophasedrops: /lib/libpamgen.so.12.17
levelset/twophasedrops: /lib/libamesos.so.12.17
levelset/twophasedrops: /lib/libgaleri-xpetra.so.12.17
levelset/twophasedrops: /lib/libgaleri-epetra.so.12.17
levelset/twophasedrops: /lib/libaztecoo.so.12.17
levelset/twophasedrops: /lib/libisorropia.so.12.17
levelset/twophasedrops: /lib/libxpetra-sup.so.12.17
levelset/twophasedrops: /lib/libxpetra.so.12.17
levelset/twophasedrops: /lib/libthyratpetra.so.12.17
levelset/twophasedrops: /lib/libthyraepetraext.so.12.17
levelset/twophasedrops: /lib/libthyraepetra.so.12.17
levelset/twophasedrops: /lib/libthyracore.so.12.17
levelset/twophasedrops: /lib/libtrilinosss.so.12.17
levelset/twophasedrops: /lib/libtpetraext.so.12.17
levelset/twophasedrops: /lib/libtpetrainout.so.12.17
levelset/twophasedrops: /lib/libtpetra.so.12.17
levelset/twophasedrops: /lib/libkokkostsqr.so.12.17
levelset/twophasedrops: /lib/libtpetraclassiclinalg.so.12.17
levelset/twophasedrops: /lib/libtpetraclassicnodeapi.so.12.17
levelset/twophasedrops: /lib/libtpetraclassic.so.12.17
levelset/twophasedrops: /lib/libepetraext.so.12.17
levelset/twophasedrops: /lib/libtriutils.so.12.17
levelset/twophasedrops: /lib/libzoltan.so.12.17
levelset/twophasedrops: /lib/libepetra.so.12.17
levelset/twophasedrops: /lib/librtop.so.12.17
levelset/twophasedrops: /lib/libkokkoskernels.so.12.17
levelset/twophasedrops: /lib/libteuchoskokkoscomm.so.12.17
levelset/twophasedrops: /lib/libteuchoskokkoscompat.so.12.17
levelset/twophasedrops: /lib/libteuchosremainder.so.12.17
levelset/twophasedrops: /lib/libteuchosnumerics.so.12.17
levelset/twophasedrops: /lib/libteuchoscomm.so.12.17
levelset/twophasedrops: /lib/libteuchosparameterlist.so.12.17
levelset/twophasedrops: /lib/libteuchosparser.so.12.17
levelset/twophasedrops: /lib/libteuchoscore.so.12.17
levelset/twophasedrops: /lib/libkokkosalgorithms.so.12.17
levelset/twophasedrops: /lib/libkokkoscontainers.so.12.17
levelset/twophasedrops: /lib/libkokkoscore.so.12.17
levelset/twophasedrops: /lib/libgtest.so.12.17
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/liblapack.so
levelset/twophasedrops: /usr/lib/libblas.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/x86_64-linux-gnu/libdl.so
levelset/twophasedrops: /usr/lib/openmpi/lib/libmpi_cxx.so
levelset/twophasedrops: /usr/lib/openmpi/lib/libmpi.so
levelset/twophasedrops: /usr/local/MATLAB/R2020a/extern/bin/glnxa64/libMatlabDataArray.so
levelset/twophasedrops: /usr/local/MATLAB/R2020a/extern/bin/glnxa64/libMatlabEngine.so
levelset/twophasedrops: num/libnum-bndData.a
levelset/twophasedrops: levelset/liblevelset-volume_adjustment.a
levelset/twophasedrops: out/libout-vtkOut.a
levelset/twophasedrops: misc/libmisc-base64.a
levelset/twophasedrops: levelset/liblevelset-levelsetmapper.a
levelset/twophasedrops: geom/libgeom-locator.a
levelset/twophasedrops: geom/libgeom-simplex.a
levelset/twophasedrops: geom/libgeom-deformation.a
levelset/twophasedrops: misc/libmisc-problem.a
levelset/twophasedrops: num/libnum-interfacePatch.a
levelset/twophasedrops: num/libnum-discretize.a
levelset/twophasedrops: num/libnum-fe.a
levelset/twophasedrops: geom/libgeom-principallattice.a
levelset/twophasedrops: geom/libgeom-subtriangulation.a
levelset/twophasedrops: geom/libgeom-reftetracut.a
levelset/twophasedrops: num/libnum-unknowns.a
levelset/twophasedrops: geom/libgeom-builder.a
levelset/twophasedrops: geom/libgeom-boundary.a
levelset/twophasedrops: misc/libmisc-utils.a
levelset/twophasedrops: misc/libmisc-params.a
levelset/twophasedrops: levelset/CMakeFiles/twophasedrops.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable twophasedrops"
	cd /home/qi/Drops/drops/Drops-Build/levelset && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/twophasedrops.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
levelset/CMakeFiles/twophasedrops.dir/build: levelset/twophasedrops

.PHONY : levelset/CMakeFiles/twophasedrops.dir/build

levelset/CMakeFiles/twophasedrops.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/levelset && $(CMAKE_COMMAND) -P CMakeFiles/twophasedrops.dir/cmake_clean.cmake
.PHONY : levelset/CMakeFiles/twophasedrops.dir/clean

levelset/CMakeFiles/twophasedrops.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/levelset /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/levelset /home/qi/Drops/drops/Drops-Build/levelset/CMakeFiles/twophasedrops.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : levelset/CMakeFiles/twophasedrops.dir/depend
