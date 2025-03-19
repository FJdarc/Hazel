add_library(Hazel SHARED
    src/Hazel.h
    src/Hazel/Core.h
    src/Hazel/Application.h
    src/Hazel/Application.cpp
    src/Hazel/EntryPoint.h
)

target_compile_definitions(Hazel PRIVATE HZ_PLATFORM_WINDOWS)
target_compile_definitions(Hazel PRIVATE HZ_BUILD_DLL)
target_include_directories(Sandbox PUBLIC ${CMAKE_SOURCE_DIR}/Hazel/vendor/spdlog/include)
