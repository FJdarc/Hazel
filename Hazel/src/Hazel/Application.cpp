#include "Hazel/Application.h"

#include "spdlog/spdlog.h"

namespace Hazel {
    Application::Application() {

    }

    Application::~Application() {

    }

    void Application::Run() {
        if (spdlog::default_logger())
            spdlog::info("spdlog ready!");

        while (true) {

        }
    }
}
