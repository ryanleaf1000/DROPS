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
include out/CMakeFiles/out-output.dir/depend.make

# Include the progress variables for this target.
include out/CMakeFiles/out-output.dir/progress.make

# Include the compile flags for this target's objects.
include out/CMakeFiles/out-output.dir/flags.make

out/CMakeFiles/out-output.dir/output.cpp.o: out/CMakeFiles/out-output.dir/flags.make
out/CMakeFiles/out-output.dir/output.cpp.o: /home/qi/Drops/drops/drops/src/out/output.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object out/CMakeFiles/out-output.dir/output.cpp.o"
	cd /home/qi/Drops/drops/Drops-Build/out && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/out-output.dir/output.cpp.o -c /home/qi/Drops/drops/drops/src/out/output.cpp

out/CMakeFiles/out-output.dir/output.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/out-output.dir/output.cpp.i"
	cd /home/qi/Drops/drops/Drops-Build/out && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/qi/Drops/drops/drops/src/out/output.cpp > CMakeFiles/out-output.dir/output.cpp.i

out/CMakeFiles/out-output.dir/output.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/out-output.dir/output.cpp.s"
	cd /home/qi/Drops/drops/Drops-Build/out && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/qi/Drops/drops/drops/src/out/output.cpp -o CMakeFiles/out-output.dir/output.cpp.s

# Object files for target out-output
out__output_OBJECTS = \
"CMakeFiles/out-output.dir/output.cpp.o"

# External object files for target out-output
out__output_EXTERNAL_OBJECTS =

out/libout-output.a: out/CMakeFiles/out-output.dir/output.cpp.o
out/libout-output.a: out/CMakeFiles/out-output.dir/build.make
out/libout-output.a: out/CMakeFiles/out-output.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qi/Drops/drops/Drops-Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libout-output.a"
	cd /home/qi/Drops/drops/Drops-Build/out && $(CMAKE_COMMAND) -P CMakeFiles/out-output.dir/cmake_clean_target.cmake
	cd /home/qi/Drops/drops/Drops-Build/out && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/out-output.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
out/CMakeFiles/out-output.dir/build: out/libout-output.a

.PHONY : out/CMakeFiles/out-output.dir/build

out/CMakeFiles/out-output.dir/clean:
	cd /home/qi/Drops/drops/Drops-Build/out && $(CMAKE_COMMAND) -P CMakeFiles/out-output.dir/cmake_clean.cmake
.PHONY : out/CMakeFiles/out-output.dir/clean

out/CMakeFiles/out-output.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src/out /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/out /home/qi/Drops/drops/Drops-Build/out/CMakeFiles/out-output.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : out/CMakeFiles/out-output.dir/depend

