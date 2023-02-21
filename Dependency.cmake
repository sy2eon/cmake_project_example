# ExternalProject 관련 명령어 셋 추가
include(ExternalProject)
# include 는 cmake에서 추가적인 기능을 사용할때 사용
# ExternalProject라는 기능을 사용하고자 함

# Dependency 관련 변수 설정
set(DEP_INSTALL_DIR ${PROJECT_BINARY_DIR}/install)
set(DEP_INCLUDE_DIR ${DEP_INSTALL_DIR}/include)
set(DEP_LIB_DIR ${DEP_INSTALL_DIR}/lib)

# spdlog : fast logger library
# spdlog 라는 라이브러리를 사용함
ExternalProject_Add(
    dep_spdlog
    # 프로젝트를 빌드를 할 때의 대표 이름
    GIT_REPOSITORY "https://github.com/gabime/spdlog.git"
    # 사용하려하는 레퍼지토리의 깃 주소
    GIT_TAG "v1.x"
    # 버젼을 세팅하는 것
    # 홈페이지를 참고 (브랜치이름/태그이름)
    GIT_SHALLOW 1
    # 1은 on/off(0)를 의미 shallow를 활성화 하겠다
    # 커밋이 매우 많기 때문에 가장 최신의 것만 다운 받겠다는 의미
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${DEP_INSTALL_DIR}
    # CMAKE 인자 -D변수=변수값
    TEST_COMMAND ""
    # ~_COMMAND 업데이트 없애고/ 수정도 안할것
)
# 이 기능들을 사용하고자 위에서 include 해준 것


# Dependency 리스트 및 라이브러리 파일 리스트 추가
set(DEP_LIST ${DEP_LIST} dep_spdlog)
set(DEP_LIBS ${DEP_LIBS} spdlog$<$<CONFIG:Debug>:d>)

# glfw
ExternalProject_Add(
    dep_glfw
    GIT_REPOSITORY "https://github.com/glfw/glfw.git"
    GIT_TAG "3.3.8"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    TEST_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${DEP_INSTALL_DIR}
        -DGLFW_BUILD_EXAMPLES=OFF
        -DGLFW_BUILD_TESTS=OFF
        -DGLFW_BUILD_DOCS=OFF
    )
set(DEP_LIST ${DEP_LIST} dep_glfw)
set(DEP_LIBS ${DEP_LIBS} glfw3)