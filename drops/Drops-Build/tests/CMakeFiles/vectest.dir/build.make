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
include tests/CMakeFiles/vectest.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/vectest.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/vectest.dir/flags.make

tests/CMakeFiles/vectest.dir/vectest.cpp.o: tests/CMakeFiles/vectest.dir/flags.make
tests/CMakeFiles/vectest.dir/vectest.cpp.o: /home/qi/Drops/drops/drops/src/tests/vectest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/vectest.dir/vectest.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vectest.dir/vectest.cpp.o -c /home/qi/Drops/drops/drops/src/tests/vectest.cpp

tests/CMakeFiles/vectest.dir/vectest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vectest.dir/vectest.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/tests/vectest.cpp > CMakeFiles/vectest.dir/vectest.cpp.i

tests/CMakeFiles/vectest.dir/vectest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vectest.dir/vectest.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/tests/vectest.cpp -o CMakeFiles/vectest.dir/vectest.cpp.s

# Object files for target vectest
vectest_OBJECTS = \
"CMakeFiles/vectest.dir/vectest.cpp.o"

# External object files for target vectest
vectest_EXTERNAL_OBJECTS =

tests/vectest: tests/CMakeFiles/vectest.dir/vectest.cpp.o
tests/vectest: tests/CMakeFiles/vectest.dir/build.make
tests/vectest: misc/libmisc-utils.a
tests/vectest: tests/CMakeFiles/vectest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable vectest"
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vectest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/vectest.dir/build: tests/vectest

.PHONY : tests/CMakeFiles/vectest.dir/build

tests/CMakeFiles/vectest.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/tests && $(CMAKE_COMMAND) -P CMakeFiles/vectest.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/vectest.dir/clean

tests/CMakeFiles/vectest.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/tests /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/tests /home/qi/Drops/drops/Drops-Build/tests/CMakeFiles/vectest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/vectest.dir/depend
