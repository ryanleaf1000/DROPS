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
include tests/CMakeFiles/testfe.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/testfe.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/testfe.dir/flags.make

tests/CMakeFiles/testfe.dir/testfe.cpp.o: tests/CMakeFiles/testfe.dir/flags.make
tests/CMakeFiles/testfe.dir/testfe.cpp.o: /home/qi/Drops/drops/drops/src/tests/testfe.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/testfe.dir/testfe.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/testfe.dir/testfe.cpp.o -c /home/qi/Drops/drops/drops/src/tests/testfe.cpp

tests/CMakeFiles/testfe.dir/testfe.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testfe.dir/testfe.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/tests/testfe.cpp > CMakeFiles/testfe.dir/testfe.cpp.i

tests/CMakeFiles/testfe.dir/testfe.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testfe.dir/testfe.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/tests/testfe.cpp -o CMakeFiles/testfe.dir/testfe.cpp.s

# Object files for target testfe
testfe_OBJECTS = \
"CMakeFiles/testfe.dir/testfe.cpp.o"

# External object files for target testfe
testfe_EXTERNAL_OBJECTS =

tests/testfe: tests/CMakeFiles/testfe.dir/testfe.cpp.o
tests/testfe: tests/CMakeFiles/testfe.dir/build.make
tests/testfe: misc/libmisc-utils.a
tests/testfe: geom/libgeom-topo.a
tests/testfe: geom/libgeom-boundary.a
tests/testfe: geom/libgeom-deformation.a
tests/testfe: misc/libmisc-problem.a
tests/testfe: num/libnum-interfacePatch.a
tests/testfe: num/libnum-fe.a
tests/testfe: geom/libgeom-simplex.a
tests/testfe: geom/libgeom-multigrid.a
tests/testfe: num/libnum-unknowns.a
tests/testfe: geom/libgeom-builder.a
tests/testfe: geom/libgeom-simplex.a
tests/testfe: geom/libgeom-deformation.a
tests/testfe: misc/libmisc-problem.a
tests/testfe: num/libnum-interfacePatch.a
tests/testfe: num/libnum-discretize.a
tests/testfe: num/libnum-fe.a
tests/testfe: geom/libgeom-principallattice.a
tests/testfe: geom/libgeom-subtriangulation.a
tests/testfe: geom/libgeom-reftetracut.a
tests/testfe: num/libnum-unknowns.a
tests/testfe: num/libnum-bndData.a
tests/testfe: misc/libmisc-utils.a
tests/testfe: geom/libgeom-boundary.a
tests/testfe: misc/libmisc-params.a
tests/testfe: tests/CMakeFiles/testfe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable testfe"
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testfe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/testfe.dir/build: tests/testfe

.PHONY : tests/CMakeFiles/testfe.dir/build

tests/CMakeFiles/testfe.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -P CMakeFiles/testfe.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/testfe.dir/clean

tests/CMakeFiles/testfe.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/tests /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/tests /home/qi/Drops/drops/Drops-Build/tests/CMakeFiles/testfe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/testfe.dir/depend
