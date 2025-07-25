workspace "Hazel"
    architecture "x64"
    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
staticruntime "off"
buildoptions "/utf-8"

project "Hazel"
    location "Hazel"
    kind "SharedLib"
    language "C++"

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
        "%{prj.name}/vendor/spdlog/include"
    }

    links
    {
        "opengl32",
        "gdi32"
    }
    
    filter "system:windows"
    	cppdialect "C++17"
    	systemversion "latest"
    	
    	defines
    	{
    	    "HZ_PLATFORM_WINDOWS",
    	    "HZ_BUILD_DLL"
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
        "Hazel/vendor/spdlog/include"
    }
    
    links
    {
    	"Hazel"
    }
    
    filter "system:windows"
    	cppdialect "C++17"
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