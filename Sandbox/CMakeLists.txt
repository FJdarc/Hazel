add_executable(Sandbox
    src/SandboxApp.cpp
)

target_link_libraries(Sandbox PRIVATE Hazel)
target_compile_definitions(Sandbox PRIVATE HZ_PLATFORM_WINDOWS)
target_include_directories(Sandbox PRIVATE ${CMAKE_SOURCE_DIR}/Hazel/src)

