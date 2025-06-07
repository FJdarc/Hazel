project "Glad"
    kind "StaticLib"
    language "C"

    targetdir ("build/" .. outputdir .. "/bin")
    objdir ("build/" .. outputdir .. "/obj/%{prj.name}")

    files
	{
        "include/glad/glad.h",
        "src/glad.c",
        "include/KHR/khrplatform.h"
    }

    includedirs
    {
        "include"
    }
    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

    filter { "system:windows", "configurations:Release" }
        buildoptions { "-static" }