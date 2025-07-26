#include "hzpch.h"

#include "Hazel/Application.h"

#include "Hazel/Events/ApplicationEvent.h"
#include "Hazel/Log.h"

namespace Hazel
{
    Application::Application()
    {
    }

    Application::~Application()
    {
    }

    void Application::Run()
    {
        WindowResizeEvent e(1280, 720);
        HZ_TRACE(e);
        while (true)
        {
        }
    }
}
