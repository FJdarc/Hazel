# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\dev\Hazel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\dev\Hazel\build\x64-debug

# Include any dependencies generated for this target.
include Hazel/CMakeFiles/Hazel.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Hazel/CMakeFiles/Hazel.dir/compiler_depend.make

# Include the progress variables for this target.
include Hazel/CMakeFiles/Hazel.dir/progress.make

# Include the compile flags for this target's objects.
include Hazel/CMakeFiles/Hazel.dir/flags.make

Hazel/CMakeFiles/Hazel.dir/codegen:
.PHONY : Hazel/CMakeFiles/Hazel.dir/codegen

Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.obj: Hazel/CMakeFiles/Hazel.dir/flags.make
Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.obj: C:/dev/Hazel/Hazel/src/Test.cpp
Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.obj: Hazel/CMakeFiles/Hazel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:\dev\Hazel\build\x64-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.obj"
	cd /d C:\dev\Hazel\build\x64-debug\Hazel && C:\PROGRA~1\mingw64\bin\X86_64~2.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.obj -MF CMakeFiles\Hazel.dir\src\Test.cpp.obj.d -o CMakeFiles\Hazel.dir\src\Test.cpp.obj -c C:\dev\Hazel\Hazel\src\Test.cpp

Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Hazel.dir/src/Test.cpp.i"
	cd /d C:\dev\Hazel\build\x64-debug\Hazel && C:\PROGRA~1\mingw64\bin\X86_64~2.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\dev\Hazel\Hazel\src\Test.cpp > CMakeFiles\Hazel.dir\src\Test.cpp.i

Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Hazel.dir/src/Test.cpp.s"
	cd /d C:\dev\Hazel\build\x64-debug\Hazel && C:\PROGRA~1\mingw64\bin\X86_64~2.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\dev\Hazel\Hazel\src\Test.cpp -o CMakeFiles\Hazel.dir\src\Test.cpp.s

# Object files for target Hazel
Hazel_OBJECTS = \
"CMakeFiles/Hazel.dir/src/Test.cpp.obj"

# External object files for target Hazel
Hazel_EXTERNAL_OBJECTS =

libs/libHazel.dll: Hazel/CMakeFiles/Hazel.dir/src/Test.cpp.obj
libs/libHazel.dll: Hazel/CMakeFiles/Hazel.dir/build.make
libs/libHazel.dll: Hazel/CMakeFiles/Hazel.dir/linkLibs.rsp
libs/libHazel.dll: Hazel/CMakeFiles/Hazel.dir/objects1.rsp
libs/libHazel.dll: Hazel/CMakeFiles/Hazel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:\dev\Hazel\build\x64-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ..\libs\libHazel.dll"
	cd /d C:\dev\Hazel\build\x64-debug\Hazel && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\Hazel.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Hazel/CMakeFiles/Hazel.dir/build: libs/libHazel.dll
.PHONY : Hazel/CMakeFiles/Hazel.dir/build

Hazel/CMakeFiles/Hazel.dir/clean:
	cd /d C:\dev\Hazel\build\x64-debug\Hazel && $(CMAKE_COMMAND) -P CMakeFiles\Hazel.dir\cmake_clean.cmake
.PHONY : Hazel/CMakeFiles/Hazel.dir/clean

Hazel/CMakeFiles/Hazel.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\dev\Hazel C:\dev\Hazel\Hazel C:\dev\Hazel\build\x64-debug C:\dev\Hazel\build\x64-debug\Hazel C:\dev\Hazel\build\x64-debug\Hazel\CMakeFiles\Hazel.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : Hazel/CMakeFiles/Hazel.dir/depend

