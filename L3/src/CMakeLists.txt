add_executable(${CMAKE_PROJECT_NAME}
  main.cpp
)

# Yep, that's it!
target_link_libraries(${CMAKE_PROJECT_NAME}
  PUBLIC
    ImGui-SFML::ImGui-SFML
)

include(Install.cmake)
