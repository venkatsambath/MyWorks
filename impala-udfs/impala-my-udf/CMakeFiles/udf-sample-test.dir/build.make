# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf

# Include any dependencies generated for this target.
include CMakeFiles/udf-sample-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/udf-sample-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/udf-sample-test.dir/flags.make

CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o: CMakeFiles/udf-sample-test.dir/flags.make
CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o: my-hash-udf-test.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o -c /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf/my-hash-udf-test.cc

CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf/my-hash-udf-test.cc > CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.i

CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf/my-hash-udf-test.cc -o CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.s

CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.requires:
.PHONY : CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.requires

CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.provides: CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.requires
	$(MAKE) -f CMakeFiles/udf-sample-test.dir/build.make CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.provides.build
.PHONY : CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.provides

CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.provides.build: CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o

# Object files for target udf-sample-test
udf__sample__test_OBJECTS = \
"CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o"

# External object files for target udf-sample-test
udf__sample__test_EXTERNAL_OBJECTS =

build/udf-sample-test: CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o
build/udf-sample-test: CMakeFiles/udf-sample-test.dir/build.make
build/udf-sample-test: build/libudfsample.so
build/udf-sample-test: CMakeFiles/udf-sample-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable build/udf-sample-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/udf-sample-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/udf-sample-test.dir/build: build/udf-sample-test
.PHONY : CMakeFiles/udf-sample-test.dir/build

CMakeFiles/udf-sample-test.dir/requires: CMakeFiles/udf-sample-test.dir/my-hash-udf-test.cc.o.requires
.PHONY : CMakeFiles/udf-sample-test.dir/requires

CMakeFiles/udf-sample-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/udf-sample-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/udf-sample-test.dir/clean

CMakeFiles/udf-sample-test.dir/depend:
	cd /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf /var/lib/hadoop-hdfs/myrepo_hdfs/impala-udfs/impala-my-udf/CMakeFiles/udf-sample-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/udf-sample-test.dir/depend
