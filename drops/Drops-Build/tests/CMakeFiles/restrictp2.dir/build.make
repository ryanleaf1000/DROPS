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
include tests/CMakeFiles/restrictp2.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/restrictp2.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/restrictp2.dir/flags.make

tests/CMakeFiles/restrictp2.dir/restrictp2.cpp.o: tests/CMakeFiles/restrictp2.dir/flags.make
tests/CMakeFiles/restrictp2.dir/restrictp2.cpp.o: /home/qi/Drops/drops/drops/src/tests/restrictp2.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/restrictp2.dir/restrictp2.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/restrictp2.dir/restrictp2.cpp.o -c /home/qi/Drops/drops/drops/src/tests/restrictp2.cpp

tests/CMakeFiles/restrictp2.dir/restrictp2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/restrictp2.dir/restrictp2.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/tests/restrictp2.cpp > CMakeFiles/restrictp2.dir/restrictp2.cpp.i

tests/CMakeFiles/restrictp2.dir/restrictp2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/restrictp2.dir/restrictp2.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/tests/restrictp2.cpp -o CMakeFiles/restrictp2.dir/restrictp2.cpp.s

# Object files for target restrictp2
restrictp2_OBJECTS = \
"CMakeFiles/restrictp2.dir/restrictp2.cpp.o"

# External object files for target restrictp2
restrictp2_EXTERNAL_OBJECTS =

tests/restrictp2: tests/CMakeFiles/restrictp2.dir/restrictp2.cpp.o
tests/restrictp2: tests/CMakeFiles/restrictp2.dir/build.make
tests/restrictp2: geom/libgeom-deformation.a
tests/restrictp2: geom/libgeom-simplex.a
tests/restrictp2: geom/libgeom-multigrid.a
tests/restrictp2: geom/libgeom-topo.a
tests/restrictp2: out/libout-output.a
tests/restrictp2: num/libnum-unknowns.a
tests/restrictp2: geom/libgeom-builder.a
tests/restrictp2: misc/libmisc-problem.a
tests/restrictp2: num/libnum-interfacePatch.a
tests/restrictp2: num/libnum-fe.a
tests/restrictp2: geom/libgeom-boundary.a
tests/restrictp2: misc/libmisc-utils.a
tests/restrictp2: geom/libgeom-simplex.a
tests/restrictp2: geom/libgeom-deformation.a
tests/restrictp2: misc/libmisc-problem.a
tests/restrictp2: num/libnum-interfacePatch.a
tests/restrictp2: num/libnum-discretize.a
tests/restrictp2: num/libnum-fe.a
tests/restrictp2: geom/libgeom-principallattice.a
tests/restrictp2: geom/libgeom-subtriangulation.a
tests/restrictp2: geom/libgeom-reftetracut.a
tests/restrictp2: num/libnum-unknowns.a
tests/restrictp2: num/libnum-bndData.a
tests/restrictp2: misc/libmisc-utils.a
tests/restrictp2: misc/libmisc-params.a
tests/restrictp2: tests/CMakeFiles/restrictp2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable restrictp2"
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/restrictp2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/restrictp2.dir/build: tests/restrictp2

.PHONY : tests/CMakeFiles/restrictp2.dir/build

tests/CMakeFiles/restrictp2.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -P CMakeFiles/restrictp2.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/restrictp2.dir/clean

tests/CMakeFiles/restrictp2.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/tests /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/tests /home/qi/Drops/drops/Drops-Build/tests/CMakeFiles/restrictp2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/restrictp2.dir/depend
