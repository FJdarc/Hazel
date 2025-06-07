#include "hzpch.h"
#include "ImGuiLayer.h"
#include "imgui.h"
#include "Platform/OpenGL/ImGuiOpenGLRenderer.h"
#include "Hazel/Application.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>
namespace Hazel
{
    ImGuiLayer::ImGuiLayer()
        : Layer("ImGuiLayer")
    {
    }
    ImGuiLayer::~ImGuiLayer()
    {
    }
    void ImGuiLayer::OnAttach()
    {
        ImGui::CreateContext();
        ImGui::StyleColorsDark();
        ImGuiIO &io = ImGui::GetIO();
        io.BackendFlags |= ImGuiBackendFlags_HasMouseCursors;
        io.BackendFlags |= ImGuiBackendFlags_HasSetMousePos;

        // io.KeyMap[ImGuiKey_A] = GLFW_KEY_A;

        ImGui_ImplOpenGL3_Init("#version 410");
    }
    void ImGuiLayer::OnDetach()
    {
    }
    void ImGuiLayer::OnUpdate()
    {
        ImGuiIO &io = ImGui::GetIO();
        Application &app = Application::Get();
        io.DisplaySize = ImVec2(app.GetWindow().GetWidth(), app.GetWindow().GetHeight());

        float time = (float)glfwGetTime();
        io.DeltaTime = m_Time > 0.0f ? (time - m_Time) : (1.0f / 60.0f);
        m_Time = time;

        ImGui_ImplOpenGL3_NewFrame();
        ImGui::NewFrame();

        static bool show = true;
        ImGui::ShowDemoWindow(&show);

        ImGui::Render();
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
    }
    void ImGuiLayer::OnEvent(Event &event)
    {
        EventDispatcher dispatcher(event);
        dispatcher.Dispatch<MouseButtonPressedEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnMouseButtonPressedEvent));
        dispatcher.Dispatch<MouseButtonReleasedEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnMouseButtonReleasedEvent));
        dispatcher.Dispatch<MouseMovedEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnMouseMovedEvent));
        dispatcher.Dispatch<MouseScrolledEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnMouseScrolledEvent));
        dispatcher.Dispatch<KeyPressedEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnKeyPressedEvent));
        dispatcher.Dispatch<KeyReleasedEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnKeyReleasedEvent));
        // dispatcher.Dispatch<KeyTypedEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnKeyTypedEvent));
        dispatcher.Dispatch<WindowResizeEvent>(HZ_BIND_EVENT_FN(ImGuiLayer::OnWindowResizeEvent));
    }

    bool ImGuiLayer::OnMouseButtonPressedEvent(MouseButtonPressedEvent &e)
    {
        ImGuiIO &io = ImGui::GetIO();
        io.MouseDown[e.GetMouseButton()] = true;

        return false;
    }

    bool ImGuiLayer::OnMouseButtonReleasedEvent(MouseButtonReleasedEvent &e)
    {
        ImGuiIO &io = ImGui::GetIO();
        io.MouseDown[e.GetMouseButton()] = false;

        return false;
    }

    bool ImGuiLayer::OnMouseMovedEvent(MouseMovedEvent &e)
    {
        ImGuiIO &io = ImGui::GetIO();
        io.MousePos = ImVec2(e.GetX(), e.GetY());

        return false;
    }

    bool ImGuiLayer::OnMouseScrolledEvent(MouseScrolledEvent &e)
    {
        ImGuiIO &io = ImGui::GetIO();
        io.MouseWheel += e.GetYOffset();
        io.MouseWheelH += e.GetXOffset();

        return false;
    }

    bool ImGuiLayer::OnKeyPressedEvent(KeyPressedEvent &e)
    {
        // ImGuiIO &io = ImGui::GetIO();
        // io.KeysDown[e.GetKeyCode()] = true;

        // io.KeyCtrl = io.KeysDown[GLFW_KEY_LEFT_CONTROL] || io.KeysDown[GLFW_KEY_RIGHT_CONTROL];
        // io.KeyShift = io.KeysDown[GLFW_KEY_LEFT_SHIFT] || io.KeysDown[GLFW_KEY_RIGHT_SHIFT];
        // io.KeyAlt = io.KeysDown[GLFW_KEY_LEFT_ALT] || io.KeysDown[GLFW_KEY_RIGHT_ALT];
        // io.KeySuper = io.KeysDown[GLFW_KEY_LEFT_SUPER] || io.KeysDown[GLFW_KEY_RIGHT_SUPER];

        return false;
    }

    bool ImGuiLayer::OnKeyReleasedEvent(KeyReleasedEvent &e)
    {
        // ImGuiIO &io = ImGui::GetIO();
        // io.KeysDown[e.GetKeyCode()] = false;

        // io.KeyCtrl = io.KeysDown[GLFW_KEY_LEFT_CONTROL] || io.KeysDown[GLFW_KEY_RIGHT_CONTROL];
        // io.KeyShift = io.KeysDown[GLFW_KEY_LEFT_SHIFT] || io.KeysDown[GLFW_KEY_RIGHT_SHIFT];
        // io.KeyAlt = io.KeysDown[GLFW_KEY_LEFT_ALT] || io.KeysDown[GLFW_KEY_RIGHT_ALT];
        // io.KeySuper = io.KeysDown[GLFW_KEY_LEFT_SUPER] || io.KeysDown[GLFW_KEY_RIGHT_SUPER];

        return false;
    }

    bool ImGuiLayer::OnWindowResizeEvent(WindowResizeEvent &e)
    {
        ImGuiIO &io = ImGui::GetIO();
        io.DisplaySize = ImVec2(e.GetWidth(), e.GetHeight());
        io.DisplayFramebufferScale = ImVec2(1.0f, 1.0f);
        glViewport(0, 0, e.GetWidth(), e.GetHeight());
        if (e.GetWidth() == 0 || e.GetHeight() == 0)
            io.DisplaySize = ImVec2(1.0f, 1.0f); // Avoid division by zero in case of minimized window
        
        return false;
    }


} // Hazel