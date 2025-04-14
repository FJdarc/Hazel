file(GLOB_RECURSE SOURCES "src/*.cpp")

add_library(Hazel SHARED ${SOURCES})

target_compile_definitions(Hazel PRIVATE HZ_BUILD_DLL)
target_compile_definitions(Hazel PUBLIC HZ_PLATFORM_WINDOWS)

target_include_directories(Hazel
    PUBLIC
        src
        vendor/spdlog/include
    PRIVATE
        src/Hazel
)