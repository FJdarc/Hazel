#include "hzpch.h"
#include "Hazel/Application.h"

#include "Hazel/Events/ApplicationEvent.h"

namespace Hazel {
    Application::Application() {

    }

    Application::~Application() {

    }

    void Application::Run() {
        WindowResizeEvent e(1280, 720);
        HZ_CORE_TRACE(e);

        while (true) {

        }
    }
}
