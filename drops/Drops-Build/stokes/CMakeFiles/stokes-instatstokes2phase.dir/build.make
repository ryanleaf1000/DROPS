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
include stokes/CMakeFiles/stokes-instatstokes2phase.dir/depend.make

# Include the progress variables for this target.
include stokes/CMakeFiles/stokes-instatstokes2phase.dir/progress.make

# Include the compile flags for this target's objects.
include stokes/CMakeFiles/stokes-instatstokes2phase.dir/flags.make

stokes/CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.o: stokes/CMakeFiles/stokes-instatstokes2phase.dir/flags.make
stokes/CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.o: /home/qi/Drops/drops/drops/src/stokes/instatstokes2phase.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object stokes/CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/stokes && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.o -c /home/qi/Drops/drops/drops/src/stokes/instatstokes2phase.cpp

stokes/CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/stokes && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/stokes/instatstokes2phase.cpp > CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.i

stokes/CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/stokes && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/stokes/instatstokes2phase.cpp -o CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.s

# Object files for target stokes-instatstokes2phase
stokes__instatstokes2phase_OBJECTS = \
"CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.o"

# External object files for target stokes-instatstokes2phase
stokes__instatstokes2phase_EXTERNAL_OBJECTS =

stokes/libstokes-instatstokes2phase.a: stokes/CMakeFiles/stokes-instatstokes2phase.dir/instatstokes2phase.cpp.o
stokes/libstokes-instatstokes2phase.a: stokes/CMakeFiles/stokes-instatstokes2phase.dir/build.make
stokes/libstokes-instatstokes2phase.a: stokes/CMakeFiles/stokes-instatstokes2phase.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libstokes-instatstokes2phase.a"
	cd /home/qi/Drops/drops/Drops-Build/stokes && $(CMAKE_COMMAND) -P CMakeFiles/stokes-instatstokes2phase.dir/cmake_clean_target.cmake
	cd /home/qi/Drops/drops/Drops-Build/stokes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stokes-instatstokes2phase.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
stokes/CMakeFiles/stokes-instatstokes2phase.dir/build: stokes/libstokes-instatstokes2phase.a

.PHONY : stokes/CMakeFiles/stokes-instatstokes2phase.dir/build

stokes/CMakeFiles/stokes-instatstokes2phase.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/stokes && $(CMAKE_COMMAND) -P CMakeFiles/stokes-instatstokes2phase.dir/cmake_clean.cmake
.PHONY : stokes/CMakeFiles/stokes-instatstokes2phase.dir/clean

stokes/CMakeFiles/stokes-instatstokes2phase.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/stokes /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/stokes /home/qi/Drops/drops/Drops-Build/stokes/CMakeFiles/stokes-instatstokes2phase.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : stokes/CMakeFiles/stokes-instatstokes2phase.dir/depend

