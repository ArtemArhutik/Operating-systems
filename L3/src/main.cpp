/*
  Разработать оконное приложение на любом языке высокого уровня, использующее
  один вспомогательный поток, вычисляющий заданное выражение и выводящий результат
  вычисления (как конечный, так и промежуточные) в любой визуальный компонент.
  В программе должны быть предусмотрены функции приостановки, возобновления и
  полной остановки выполнения потока с выводом соответствующего сообщения. В
  случае быстрого выполнения потока и, как следствие, невозможности демонстрации
  функций приостановки, продумать искусственное "торможение" потока для достижения
  заданных целей. Обработать исключения. 
*/

#include <iostream>

#include "imgui-SFML.h"
#include "imgui.h"

#include <SFML/Graphics/CircleShape.hpp>
#include <SFML/Graphics/RenderWindow.hpp>
#include <SFML/System/Clock.hpp>
#include <SFML/Window/Event.hpp>

void Run() {}

void Pause() {}

void Continue() {}

void Stop() {}

enum class State {
  Paused,
  Performed,
  Stopped
};

int main() {
  sf::RenderWindow window(sf::VideoMode(640, 480), "L3");
  window.setFramerateLimit(60);
  ImGui::SFML::Init(window);

  State state { State::Performed };
  Run();

  sf::Clock deltaClock;
  while (window.isOpen()) {
    sf::Event event;
    while (window.pollEvent(event)) {
      ImGui::SFML::ProcessEvent(event);
      if (event.type == sf::Event::Closed) {
        window.close();
      }
    }

    ImGui::SFML::Update(window, deltaClock.restart());

    // Actions
    ImGui::Begin("Actions:");
      // Bottons
      if (ImGui::Button("Pause")) {
        if (state != State::Paused) {
          Pause();
          state = State::Paused;
        }
      }
      if (ImGui::Button("Continue")) {
        if (state != State::Performed) {
          Continue();
          state = State::Performed;
        }
      }
      if (ImGui::Button("Stop")) {
        if (state != State::Stopped) {
          Stop();
          state = State::Stopped;
        }
      }

      // State indicator.
      ImGui::TextColored(ImVec4(1, 1, 0, 1), "State:");
      switch (state) {
        case State::Paused:
          ImGui::TextColored(ImVec4(1, 0.5, 0, 1), "  Thread is paused.");
          break;
        case State::Performed:
          ImGui::TextColored(ImVec4(0, 1, 0, 1), "  Thread is performed.");
          break;
        case State::Stopped:
          ImGui::TextColored(ImVec4(1, 0, 0, 1), "  Thread is stopped.");
          break;
        default:
          break;
      }
    ImGui::End();

    // Log
    ImGui::Begin("Thread calculation log:");
      ImGui::BeginChild("Scrolling");
        for (int n = 0; n < 50; n++) {
          ImGui::Text("%04d: Some text", n);
        }
      ImGui::EndChild();
    ImGui::End();

    window.clear();
    ImGui::SFML::Render(window);
    window.display();
  }

  ImGui::SFML::Shutdown();

  return 0;
}

