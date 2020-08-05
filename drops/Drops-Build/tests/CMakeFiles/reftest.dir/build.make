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
include tests/CMakeFiles/reftest.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/reftest.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/reftest.dir/flags.make

tests/CMakeFiles/reftest.dir/reftest.cpp.o: tests/CMakeFiles/reftest.dir/flags.make
tests/CMakeFiles/reftest.dir/reftest.cpp.o: /home/qi/Drops/drops/drops/src/tests/reftest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/reftest.dir/reftest.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/reftest.dir/reftest.cpp.o -c /home/qi/Drops/drops/drops/src/tests/reftest.cpp

tests/CMakeFiles/reftest.dir/reftest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/reftest.dir/reftest.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/tests/reftest.cpp > CMakeFiles/reftest.dir/reftest.cpp.i

tests/CMakeFiles/reftest.dir/reftest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/reftest.dir/reftest.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/tests/reftest.cpp -o CMakeFiles/reftest.dir/reftest.cpp.s

# Object files for target reftest
reftest_OBJECTS = \
"CMakeFiles/reftest.dir/reftest.cpp.o"

# External object files for target reftest
reftest_EXTERNAL_OBJECTS =

tests/reftest: tests/CMakeFiles/reftest.dir/reftest.cpp.o
tests/reftest: tests/CMakeFiles/reftest.dir/build.make
tests/reftest: geom/libgeom-boundary.a
tests/reftest: geom/libgeom-builder.a
tests/reftest: geom/libgeom-deformation.a
tests/reftest: geom/libgeom-simplex.a
tests/reftest: geom/libgeom-multigrid.a
tests/reftest: num/libnum-unknowns.a
tests/reftest: misc/libmisc-utils.a
tests/reftest: geom/libgeom-topo.a
tests/reftest: out/libout-output.a
tests/reftest: misc/libmisc-problem.a
tests/reftest: num/libnum-interfacePatch.a
tests/reftest: num/libnum-fe.a
tests/reftest: geom/libgeom-boundary.a
tests/reftest: geom/libgeom-simplex.a
tests/reftest: geom/libgeom-deformation.a
tests/reftest: misc/libmisc-problem.a
tests/reftest: num/libnum-interfacePatch.a
tests/reftest: misc/libmisc-utils.a
tests/reftest: num/libnum-discretize.a
tests/reftest: num/libnum-fe.a
tests/reftest: geom/libgeom-principallattice.a
tests/reftest: geom/libgeom-subtriangulation.a
tests/reftest: geom/libgeom-reftetracut.a
tests/reftest: num/libnum-unknowns.a
tests/reftest: num/libnum-bndData.a
tests/reftest: misc/libmisc-params.a
tests/reftest: tests/CMakeFiles/reftest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable reftest"
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/reftest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/reftest.dir/build: tests/reftest

.PHONY : tests/CMakeFiles/reftest.dir/build

tests/CMakeFiles/reftest.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -P CMakeFiles/reftest.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/reftest.dir/clean

tests/CMakeFiles/reftest.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/tests /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/tests /home/qi/Drops/drops/Drops-Build/tests/CMakeFiles/reftest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/reftest.dir/depend

