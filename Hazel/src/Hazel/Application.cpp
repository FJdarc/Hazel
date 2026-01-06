#include "Hazel/Application.h"

#include "Hazel/Log.h"

namespace Hazel {
    Application::Application() {

    }

    Application::~Application() {

    }

    void Application::Run() {
        HZ_CORE_INFO("Core logger ready!");
        HZ_INFO("Client logger ready!");

        while (true) {

        }
    }
}
