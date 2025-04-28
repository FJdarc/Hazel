#pragma once

#include "Core.h"
#include "Hazel/Events/Event.h"

namespace Hazel
{
  class HAZEL_API Application
  {
  public:
    Application();
    virtual ~Application();
    void Run();
  };
  // To be defined in CLIENT
  Application *CreateApplication();
}