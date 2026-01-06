#pragma once

#include "Hazel/Core.h"
#include "Hazel/Events/Event.h"
#include "Hazel/Events/ApplicationEvent.h"

#include "Hazel/Window.h"

namespace Hazel {
	class Application {
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);
	
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}