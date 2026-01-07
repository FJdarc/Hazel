project "Glad"
    kind "StaticLib"
    language "C"
    
    targetdir ("build/" .. outputdir .. "/bin")
    objdir ("build/" .. outputdir .. "/obj/%{prj.name}")

    files
    {
        "include/glad/glad.h",
        "include/KHR/khrplatform.h",
        "src/glad.c"
    }

    includedirs
    {
        "include"
    }
    
    filter "system:linux"
        systemversion "latest"
        linkoptions "-pthread"

    filter "system:windows"
        systemversion "latest"
        staticruntime "off"

    filter "configurations:Debug"
        optimize "Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        optimize "Speed"
        runtime "Release"
        symbols "On"

    filter "configurations:Dist"
        optimize "Full"
        runtime "Release"
        symbols "Off"
