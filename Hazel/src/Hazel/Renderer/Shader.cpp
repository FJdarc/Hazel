#include "hzpch.h"
#include "Shader.h"

#include <glad/glad.h>

namespace Hazel {
	Shader::Shader(const std::string& vertexSrc, const std::string& fragmentSrc)
	{
        // 创建空的顶点着色器句柄
        GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);

        // 向GL传递顶点着色器源码
        // 注意：std::string的.c_str()方法返回以NULL结尾的字符串
        const GLchar* source = (const GLchar*)vertexSrc.c_str();
        glShaderSource(vertexShader, 1, &source, 0);

        // 编译顶点着色器
        glCompileShader(vertexShader);

        GLint isCompiled = 0;
        glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &isCompiled);
        if (isCompiled == GL_FALSE)
        {
            GLint maxLength = 0;
            glGetShaderiv(vertexShader, GL_INFO_LOG_LENGTH, &maxLength);

            // maxLength已包含NULL终止字符
            std::vector<GLchar> infoLog(maxLength);
            glGetShaderInfoLog(vertexShader, maxLength, &maxLength, &infoLog[0]);

            // 不再需要此着色器
            glDeleteShader(vertexShader);

            // 可自行处理infoLog中的信息

			HZ_CORE_ERROR("{0}", infoLog.data());
			HZ_CORE_ASSERT(false, "Vertex shader compilation failure!");
            return;
        }

        // 创建空的片段着色器句柄
        GLuint fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);

        // 向GL传递片段着色器源码
        // 注意：std::string的.c_str()方法返回以NULL结尾的字符串
        source = (const GLchar*)fragmentSrc.c_str();
        glShaderSource(fragmentShader, 1, &source, 0);

        // 编译片段着色器
        glCompileShader(fragmentShader);

        glGetShaderiv(fragmentShader, GL_COMPILE_STATUS, &isCompiled);
        if (isCompiled == GL_FALSE)
        {
            GLint maxLength = 0;
            glGetShaderiv(fragmentShader, GL_INFO_LOG_LENGTH, &maxLength);

            // maxLength已包含NULL终止字符
            std::vector<GLchar> infoLog(maxLength);
            glGetShaderInfoLog(fragmentShader, maxLength, &maxLength, &infoLog[0]);

            // 不再需要此着色器
            glDeleteShader(fragmentShader);
            // 两者都需要清理，避免着色器资源泄漏
            glDeleteShader(vertexShader);

            // 可自行处理infoLog中的信息

            HZ_CORE_ERROR("{0}", infoLog.data());
            HZ_CORE_ASSERT(false, "Fragment shader compilation failure!");
            return;
        }

        // 顶点与片段着色器编译成功
        // 现在将其链接为完整程序
        // 获取程序对象
        m_RendererID = glCreateProgram();
		GLuint program = m_RendererID;

        // 将着色器附加到程序
        glAttachShader(program, vertexShader);
        glAttachShader(program, fragmentShader);

        // 链接程序
        glLinkProgram(program);

        // 注意此处使用glGetProgram*而非glGetShader*
        GLint isLinked = 0;
        glGetProgramiv(program, GL_LINK_STATUS, (int*)&isLinked);
        if (isLinked == GL_FALSE)
        {
            GLint maxLength = 0;
            glGetProgramiv(program, GL_INFO_LOG_LENGTH, &maxLength);

            // maxLength已包含NULL终止字符
            std::vector<GLchar> infoLog(maxLength);
            glGetProgramInfoLog(program, maxLength, &maxLength, &infoLog[0]);

            // 不再需要此程序
            glDeleteProgram(program);
            // 同时清理着色器避免泄漏
            glDeleteShader(vertexShader);
            glDeleteShader(fragmentShader);

            // 可自行处理infoLog中的信息

            HZ_CORE_ERROR("{0}", infoLog.data());
            HZ_CORE_ASSERT(false, "Shader link failure!");
            return;
        }

        // 链接成功后始终分离着色器
        glDetachShader(program, vertexShader);
        glDetachShader(program, fragmentShader);
	}

	Shader::~Shader()
	{
        glDeleteProgram(m_RendererID);
	}

	void Shader::Bind() const
	{
		glUseProgram(m_RendererID);
	}

	void Shader::Unbind() const
	{
		glUseProgram(0);
	}
}