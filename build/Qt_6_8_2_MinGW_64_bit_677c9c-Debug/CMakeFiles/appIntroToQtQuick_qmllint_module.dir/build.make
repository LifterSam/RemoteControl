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

# Utility rule file for appIntroToQtQuick_qmllint_module.

# Include any custom commands dependencies for this target.
include CMakeFiles/appIntroToQtQuick_qmllint_module.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/appIntroToQtQuick_qmllint_module.dir/progress.make

CMakeFiles/appIntroToQtQuick_qmllint_module: C:/Qt/6.9.0/mingw_64/bin/qmllint.exe
CMakeFiles/appIntroToQtQuick_qmllint_module: C:/QT_Testing/04_QML-for-Beginners-Challenges-Intro-Qt-Quick/StartingProject/Main.qml
CMakeFiles/appIntroToQtQuick_qmllint_module: .rcc/qmllint/appIntroToQtQuick_module.rsp
	cd /d C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject && call C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug\.qt\bin\qt_setup_tool_path.bat C:/Qt/6.9.0/mingw_64/bin/qmllint.exe @C:/QT_Testing/04_QML-for-Beginners-Challenges-Intro-Qt-Quick/StartingProject/build/Qt_6_8_2_MinGW_64_bit_677c9c-Debug/.rcc/qmllint/appIntroToQtQuick_module.rsp

appIntroToQtQuick_qmllint_module: CMakeFiles/appIntroToQtQuick_qmllint_module
appIntroToQtQuick_qmllint_module: CMakeFiles/appIntroToQtQuick_qmllint_module.dir/build.make
.PHONY : appIntroToQtQuick_qmllint_module

# Rule to build all files generated by this target.
CMakeFiles/appIntroToQtQuick_qmllint_module.dir/build: appIntroToQtQuick_qmllint_module
.PHONY : CMakeFiles/appIntroToQtQuick_qmllint_module.dir/build

CMakeFiles/appIntroToQtQuick_qmllint_module.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\appIntroToQtQuick_qmllint_module.dir\cmake_clean.cmake
.PHONY : CMakeFiles/appIntroToQtQuick_qmllint_module.dir/clean

CMakeFiles/appIntroToQtQuick_qmllint_module.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug C:\QT_Testing\04_QML-for-Beginners-Challenges-Intro-Qt-Quick\StartingProject\build\Qt_6_8_2_MinGW_64_bit_677c9c-Debug\CMakeFiles\appIntroToQtQuick_qmllint_module.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/appIntroToQtQuick_qmllint_module.dir/depend

