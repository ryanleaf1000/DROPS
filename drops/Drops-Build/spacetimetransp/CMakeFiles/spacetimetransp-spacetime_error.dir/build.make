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
include spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/depend.make

# Include the progress variables for this target.
include spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/progress.make

# Include the compile flags for this target's objects.
include spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/flags.make

spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.o: spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/flags.make
spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.o: /home/qi/Drops/drops/drops/src/spacetimetransp/spacetime_error.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/spacetimetransp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.o -c /home/qi/Drops/drops/drops/src/spacetimetransp/spacetime_error.cpp

spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/spacetimetransp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/spacetimetransp/spacetime_error.cpp > CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.i

spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/spacetimetransp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/spacetimetransp/spacetime_error.cpp -o CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.s

# Object files for target spacetimetransp-spacetime_error
spacetimetransp__spacetime_error_OBJECTS = \
"CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.o"

# External object files for target spacetimetransp-spacetime_error
spacetimetransp__spacetime_error_EXTERNAL_OBJECTS =

spacetimetransp/libspacetimetransp-spacetime_error.a: spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/spacetime_error.cpp.o
spacetimetransp/libspacetimetransp-spacetime_error.a: spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/build.make
spacetimetransp/libspacetimetransp-spacetime_error.a: spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libspacetimetransp-spacetime_error.a"
	cd /home/qi/Drops/drops/Drops-Build/spacetimetransp && $(CMAKE_COMMAND) -P CMakeFiles/spacetimetransp-spacetime_error.dir/cmake_clean_target.cmake
	cd /home/qi/Drops/drops/Drops-Build/spacetimetransp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spacetimetransp-spacetime_error.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/build: spacetimetransp/libspacetimetransp-spacetime_error.a

.PHONY : spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/build

spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/spacetimetransp && $(CMAKE_COMMAND) -P CMakeFiles/spacetimetransp-spacetime_error.dir/cmake_clean.cmake
.PHONY : spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/clean

spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/spacetimetransp /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/spacetimetransp /home/qi/Drops/drops/Drops-Build/spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : spacetimetransp/CMakeFiles/spacetimetransp-spacetime_error.dir/depend

