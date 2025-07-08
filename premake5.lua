workspace "Hazel"
    architecture "x64"
    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
toolset "clang"
staticruntime "off"

IncludeDir = {}
IncludeDir["GLFW"] = "Hazel/vendor/GLFW/include"
IncludeDir["Glad"] = "Hazel/vendor/Glad/include"
IncludeDir["ImGui"] = "Hazel/vendor/imgui"
IncludeDir["glm"] = "Hazel/vendor/glm"
include "Hazel/vendor/GLFW"
include "Hazel/vendor/Glad"
include "Hazel/vendor/imgui"

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
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/vendor/glm/glm/**.hpp",
        "%{prj.name}/vendor/glm/glm/**.inl"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
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
        "Hazel/vendor/spdlog/include",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
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
        symbols "On"

    filter "configurations:Release"
        defines "HZ_RELEASE"
        optimize "On"
        
    filter "configurations:DIST"
        defines "HZ_DIST"
        optimize "On"