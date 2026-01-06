workspace "Hazel"
    architecture "x86_64"
    startproject "Sandbox"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Hazel"
    location "Hazel"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir ("build/" .. outputdir .. "/bin")
    objdir ("build/" .. outputdir .. "/obj/%{prj.name}")

    pchheader "hzpch.h"
    pchsource "%{prj.name}/src/hzpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    defines
    {
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include"
    }

    links
    {
    }

    dependson
    {
    }

    filter "system:windows"
        systemversion "latest"
        buildoptions "/utf-8"

        defines
        {
            "HZ_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "HZ_DEBUG"
        optimize "Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "HZ_RELEASE"
        optimize "Speed"
        runtime "Release"
        symbols "On"

    filter "configurations:Dist"
        defines "HZ_DIST"
        optimize "Full"
        runtime "Release"
        symbols "Off"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir ("build/" .. outputdir .. "/bin")
    objdir ("build/" .. outputdir .. "/obj/%{prj.name}")

    files
    {
        "Sandbox/src/**.h",
        "Sandbox/src/**.cpp"
    }

    defines
    {
    }

    includedirs
    {
        "Hazel/src",
        "Hazel/vendor/spdlog/include"
    }

    links
    {
        "Hazel"
    }

    dependson
    {
        "Hazel"
    }

    filter "system:windows"
        systemversion "latest"
        buildoptions "/utf-8"

        defines
        {
            "HZ_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "HZ_DEBUG"
        optimize "Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "HZ_RELEASE"
        optimize "Speed"
        runtime "Release"
        symbols "On"

    filter "configurations:Dist"
        defines "HZ_DIST"
        optimize "Full"
        runtime "Release"
        symbols "Off"
