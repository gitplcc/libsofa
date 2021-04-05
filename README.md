# libsofa
"CMake ready" repository that integrates [UAI SOFA C library](https://www.iausofa.org/current_C.html#Downloads) in CMake build system.

It supports:
- Compiling library as dynamic or static.
- Including library in the app tree (i.e.: <MYAPPDIR>/external/libsofa),
- or building & installing the library in its own user directory and registering it in user local CMake registry,
- or building, installing and registering library system wide.

Using SOFA::SOFA target with link_libraries command adds all SOFA library needed include directories and dependencies to user targets.

``` 
myapp.c

#include <libsofa/sofa.h>

void main(int argc, char *argv)
{
...
}

CMakeLists.txt

find_package(SOFA REQUIRED) # library built & installed in its own directory or system wide
- or -
add_subdirectory(external/libsofa) # library in app source tree

...

add_executable(myapp myapp.c)
link_libraries(myapp SOFA::SOFA)
```
