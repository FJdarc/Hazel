#pragma once

#include "Hazel/Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace Hazel
{
    class HAZEL_API Log
    {
    public:
        static void Init()
        {
            spdlog::set_pattern("%^[%T] %n: %v%$");
            spdlog::stdout_color_mt("HAZEL");
            spdlog::stdout_color_mt("APP");
        }
    };
}

#define HZ_CORE_TRACE(...)  spdlog::get("HAZEL")->trace(__VA_ARGS__)
#define HZ_CORE_INFO(...)  spdlog::get("HAZEL")->info(__VA_ARGS__)
#define HZ_CORE_WARN(...)  spdlog::get("HAZEL")->warn(__VA_ARGS__)
#define HZ_CORE_ERROR(...)  spdlog::get("HAZEL")->error(__VA_ARGS__)
#define HZ_CORE_CRITICAL(...)  spdlog::get("HAZEL")->critical(__VA_ARGS__)

#define HZ_TRACE(...)  spdlog::get("APP")->trace(__VA_ARGS__)
#define HZ_INFO(...)  spdlog::get("APP")->info(__VA_ARGS__)
#define HZ_WARN(...)  spdlog::get("APP")->warn(__VA_ARGS__)
#define HZ_ERROR(...)  spdlog::get("APP")->error(__VA_ARGS__)
#define HZ_CRITICAL(...)  spdlog::get("APP")->critical(__VA_ARGS__)