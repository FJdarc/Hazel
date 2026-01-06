#include "hzpch.h"
#include "Hazel/Application.h"

#include <GLFW/glfw3.h>

namespace Hazel {
    Application::Application() {
        m_Window = std::unique_ptr<Window>(Window::Create());
        m_Window->SetEventCallback(HZ_BIND_EVENT_FN(Application::OnEvent));
    }

    Application::~Application() {

    }

    void Application::OnEvent(Event& e) {
        EventDispatcher dispatcher(e);
        dispatcher.Dispatch<WindowCloseEvent>(HZ_BIND_EVENT_FN(Application::OnWindowClose));
        HZ_CORE_TRACE(e);
    }

    void Application::Run() {
        WindowResizeEvent e(1280, 720);
        HZ_CORE_TRACE(e);

        while (m_Running) {
            glClearColor(1, 0, 1, 1);
            glClear(GL_COLOR_BUFFER_BIT);
            m_Window->OnUpdate();
        }
    }

    bool Application::OnWindowClose(WindowCloseEvent& e) {
        m_Running = false;
        return true;
    }
}
