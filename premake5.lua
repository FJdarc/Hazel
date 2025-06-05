package.path = package.path .. ";" .. path.getabsolute("vendor/premake-export-compile-commands/?.lua")

require "export-compile-commands"

workspace "Hazel"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }
    toolset "clang"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Hazel/vendor/GLFW/include"
IncludeDir["Glad"] = "Hazel/vendor/Glad/include"
include "Hazel/vendor/GLFW"
include "Hazel/vendor/Glad"

project "Hazel"
    location "Hazel"
    kind "SharedLib"
    language "C++"

    targetdir ("build/" .. outputdir .. "/bin")
    objdir ("build/" .. outputdir .. "/obj/%{prj.name}")

    pchheader "hzpch.h"
    pchsource "Hazel/src/hzpch.cpp"

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
    
    filter "system:windows"
    	cppdialect "C++17"
    	staticruntime "On"
    	systemversion "latest"
    	
    	defines
    	{
    	    "HZ_PLATFORM_WINDOWS",
    	    "HZ_BUILD_DLL",
    	    "GLFW_INCLUDE_NONE"
    	}

    filter "configurations:Debug"
        defines "HZ_DEBUG"
        buildoptions "-g"
        symbols "On"

    filter "configurations:Release"
        defines "HZ_RELEASE"
        optimize "On"
        
    filter "configurations:DIST"
        defines "HZ_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    
    targetdir ("build/" .. outputdir .. "/bin")
    objdir ("build/" .. outputdir .. "/obj/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
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
    
    filter "system:windows"
    	cppdialect "C++17"
    	staticruntime "On"
    	systemversion "latest"
    	
    	defines
    	{
    	    "HZ_PLATFORM_WINDOWS"
    	}

    filter "configurations:Debug"
        defines "HZ_DEBUG"
        buildoptions "-g"
        symbols "On"

    filter "configurations:Release"
        defines "HZ_RELEASE"
        optimize "On"

    filter "configurations:DIST"
        defines "HZ_DIST"
        optimize "On"