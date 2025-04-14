#pragma once

#ifdef HZ_PLATFORM_WINDOWS

//工厂模式
extern Hazel::Application *Hazel::CreateApplication();

int main(int argc, char **argv)
{
    Hazel::Log::Init();
    HZ_CORE_TRACE("Core");
    HZ_INFO("APP");

    auto app = Hazel::CreateApplication();
    app->Run();
    delete app;
}
#endif