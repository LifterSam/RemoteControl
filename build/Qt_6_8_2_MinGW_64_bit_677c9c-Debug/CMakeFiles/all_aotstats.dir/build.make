# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.30

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
CMAKE_COMMAND = C:\Qt\Tools\CMake_64\bin\cmake.exe

# The command to remove a file.
RM = C:\Qt\Tools\CMake_64\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug

# Utility rule file for all_aotstats.

# Include any custom commands dependencies for this target.
include CMakeFiles/all_aotstats.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/all_aotstats.dir/progress.make

CMakeFiles/all_aotstats: .rcc/qmlcache/all_aotstats.txt
	C:\Qt\Tools\CMake_64\bin\cmake.exe -E cat C:/QT_Testing/04_QML-for-Beginners-Challenges-Intro-Qt-Quick/StartingProject/build/Qt_6_8_2_MinGW_64_bit_677c9c-Debug/.rcc/qmlcache/all_aotstats.txt

.rcc/qmlcache/all_aotstats.aotstats: .rcc/qmlcache/module_appIntroToQtQuick.aotstats
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating .rcc/qmlcache/all_aotstats.aotstats, .rcc/qmlcache/all_aotstats.txt"
	call .qt\bin\qt_setup_tool_path.bat C:/Qt/6.9.0/mingw_64/bin/qmlaotstats.exe aggregate C:/QT_Testing/04_QML-for-Beginners-Challenges-Intro-Qt-Quick/StartingProject/build/Qt_6_8_2_MinGW_64_bit_677c9c-Debug/.rcc/qmlcache/all_aotstats.aotstatslist C:/QT_Testing/04_QML-for-Beginners-Challenges-Intro-Qt-Quick/StartingProject/build/Qt_6_8_2_MinGW_64_bit_677c9c-Debug/.rcc/qmlcache/all_aotstats.aotstats
	call .qt\bin\qt_setup_tool_path.bat C:/Qt/6.9.0/mingw_64/bin/qmlaotstats.exe format C:/QT_Testing/04_QML-for-Beginners-Challenges-Intro-Qt-Quick/StartingProject/build/Qt_6_8_2_MinGW_64_bit_677c9c-Debug/.rcc/qmlcache/all_aotstats.aotstats C:/QT_Testing/04_QML-for-Beginners-Challenges-Intro-Qt-Quick/StartingProject/build/Qt_6_8_2_MinGW_64_bit_677c9c-Debug/.rcc/qmlcache/all_aotstats.txt

.rcc/qmlcache/all_aotstats.txt: .rcc/qmlcache/all_aotstats.aotstats
	@$(CMAKE_COMMAND) -E touch_nocreate .rcc\qmlcache\all_aotstats.txt

all_aotstats: .rcc/qmlcache/all_aotstats.aotstats
all_aotstats: .rcc/qmlcache/all_aotstats.txt
all_aotstats: CMakeFiles/all_aotstats
all_aotstats: CMakeFiles/all_aotstats.dir/build.make
.PHONY : all_aotstats

# Rule to build all files generated by this target.
CMakeFiles/all_aotstats.dir/build: all_aotstats
.PHONY : CMakeFiles/all_aotstats.dir/build

CMakeFiles/all_aotstats.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\all_aotstats.dir\cmake_clean.cmake
.PHONY : CMakeFiles/all_aotstats.dir/clean

CMakeFiles/all_aotstats.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug\CMakeFiles\all_aotstats.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/all_aotstats.dir/depend

