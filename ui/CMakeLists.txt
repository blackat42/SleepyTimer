project(ui)

find_package(Qt6 COMPONENTS Quick Qml Core REQUIRED)

add_library(${PROJECT_NAME})

qt_policy(SET QTP0001 NEW)

qt_add_qml_module(${PROJECT_NAME}
    URI ui
    VERSION 1.0
    QML_FILES
        Main.qml
        components/SpinBoxTimer.qml
        pages/Home.qml
        pages/Info.qml
        
    RESOURCES
        qmldir
        components/qmldir
        pages/qmldir
)

target_link_libraries(${PROJECT_NAME} 
    PUBLIC 
        Qt6::Quick
        Qt6::Qml
        Qt6::Core
)

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
