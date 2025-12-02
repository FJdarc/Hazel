#include <Hazel.h>
#include "glm/glm.hpp"
class ExampleLayer : public Hazel::Layer
{
public:
    ExampleLayer()
        : Layer("Example")
    {
    }

    void OnUpdate() override
    {
        if (Hazel::Input::IsKeyPressed(Hazel::Key::Tab))
        {
            HZ_TRACE("Tab key is pressed (poll)!");
        }
    }

    void OnEvent(Hazel::Event& event) override
    {
        //HZ_TRACE("{0}", event);
    }
};

class Sandbox : public Hazel::Application
{
public:
    Sandbox()
    {
        PushLayer(new ExampleLayer());
    }

    ~Sandbox()
    {
    }
};

Hazel::Application* Hazel::CreateApplication() { return new Sandbox(); }
