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

# Utility rule file for ctagsdb.

# Include the progress variables for this target.
include CMakeFiles/ctagsdb.dir/progress.make

CMakeFiles/ctagsdb:
	cd /home/qi/Drops/drops/drops/src && ctags -R --c++-kinds=+p --extra=+q --fields=+iaS --tag-relative=yes --c++-types=+px --excmd=pattern --exclude=Makefile --exclude= --langmap=c++:+.tpp -f /home/qi/Drops/drops/Drops-Build/ctagsdb

ctagsdb: CMakeFiles/ctagsdb
ctagsdb: CMakeFiles/ctagsdb.dir/build.make

.PHONY : ctagsdb

# Rule to build all files generated by this target.
CMakeFiles/ctagsdb.dir/build: ctagsdb

.PHONY : CMakeFiles/ctagsdb.dir/build

CMakeFiles/ctagsdb.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ctagsdb.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ctagsdb.dir/clean

CMakeFiles/ctagsdb.dir/depend:
	cd /home/qi/Drops/drops/Drops-Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/drops/src /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build /home/qi/Drops/drops/Drops-Build/CMakeFiles/ctagsdb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ctagsdb.dir/depend
