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
include misc/CMakeFiles/misc-scalarFunctions.dir/depend.make

# Include the progress variables for this target.
include misc/CMakeFiles/misc-scalarFunctions.dir/progress.make

# Include the compile flags for this target's objects.
include misc/CMakeFiles/misc-scalarFunctions.dir/flags.make

misc/CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.o: misc/CMakeFiles/misc-scalarFunctions.dir/flags.make
misc/CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.o: /home/qi/Drops/drops/drops/src/misc/scalarFunctions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object misc/CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/misc && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.o -c /home/qi/Drops/drops/drops/src/misc/scalarFunctions.cpp

misc/CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/misc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/misc/scalarFunctions.cpp > CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.i

misc/CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/misc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/misc/scalarFunctions.cpp -o CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.s

# Object files for target misc-scalarFunctions
misc__scalarFunctions_OBJECTS = \
"CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.o"

# External object files for target misc-scalarFunctions
misc__scalarFunctions_EXTERNAL_OBJECTS =

misc/libmisc-scalarFunctions.so: misc/CMakeFiles/misc-scalarFunctions.dir/scalarFunctions.cpp.o
misc/libmisc-scalarFunctions.so: misc/CMakeFiles/misc-scalarFunctions.dir/build.make
misc/libmisc-scalarFunctions.so: misc/CMakeFiles/misc-scalarFunctions.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libmisc-scalarFunctions.so"
	cd /home/qi/Drops/drops/Drops-Build/misc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/misc-scalarFunctions.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
misc/CMakeFiles/misc-scalarFunctions.dir/build: misc/libmisc-scalarFunctions.so

.PHONY : misc/CMakeFiles/misc-scalarFunctions.dir/build

misc/CMakeFiles/misc-scalarFunctions.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/misc && $(CMAKE_COMMAND) -P CMakeFiles/misc-scalarFunctions.dir/cmake_clean.cmake
.PHONY : misc/CMakeFiles/misc-scalarFunctions.dir/clean

misc/CMakeFiles/misc-scalarFunctions.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/misc /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/misc /home/qi/Drops/drops/Drops-Build/misc/CMakeFiles/misc-scalarFunctions.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : misc/CMakeFiles/misc-scalarFunctions.dir/depend
