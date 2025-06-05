#pragma once

#include "Hazel/Core.h"

#include "Hazel/Window.h"
#include "Hazel/LayerStack.h"
#include "Hazel/Events/Event.h"
#include "Hazel/Events/ApplicationEvent.h"

namespace Hazel {
class HAZEL_API Application {
 public:
  Application();
  virtual ~Application();
  void Run();
  void OnEvent(Event &e);
 void PushLayer(Layer *layer);
 void Pushoverlay(Layer *overlay);
 private:
  bool OnWindowClose(WindowCloseEvent &e);
  std::unique_ptr<Window> m_Window;
  bool m_Running = true;
 LayerStack m_LayerStack;
};
// To be defined in CLIENT
Application *CreateApplication();
}  // namespace Hazel