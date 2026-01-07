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

-- Include directories relative to root folder
IncludeDir = {}
IncludeDir["GLFW"] = "Hazel/vendor/GLFW/include"
IncludeDir["Glad"] = "Hazel/vendor/Glad/include"

include "Hazel/vendor/GLFW"
include "Hazel/vendor/Glad"

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

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}"
    }

    links
    {
        "GLFW",
        "Glad",
        "opengl32",
        "gdi32"
    }

    dependson
    {
        "GLFW",
        "Glad"
    }

    filter "action:vs*"
        buildoptions "/utf-8"

    filter "system:windows"
        systemversion "latest"

        defines
        {
            "HZ_PLATFORM_WINDOWS",
            "GLFW_INCLUDE_NONE"
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

    filter "action:vs*"
        buildoptions "/utf-8"

    filter "system:windows"
        systemversion "latest"

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
