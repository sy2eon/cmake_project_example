cmake_minimum_required(VERSION 3.13)
# 이 cmake 프로젝트를 가지고 프로젝트를 관리를 하려면
# 현재 컴퓨터의 cmake 버젼이 3.13 이상이어야 함(제약)

set(PROJECT_NAME cmake_project_example)
# set으로 변수를 설정함
# PROJECT_NAME 이라는 변수에 'cmake_project_example'이라는 string을 때려 넣은 것
# 이 변수를 사용할 때는 ${변수명} 이렇게 쓰면 된다.
set(CMAKE_CXX_STANDARD 17)
# 변수를 설정
# cmake로 시작하는 변수들은 글로벌 변수임
# cmake에서 지정 되어있는 predefined된 것들
# 다른 값으로 바꾸는 과정 
# cmake_c++_standard 는 현재 11 14 17 버젼이 있는데
# 가장 최신 버젼인 17을 사용하려고 바꾸는 것

project(${PROJECT_NAME})
# 이제 본격적으로 내 project를 세팅할 것이다.
# 이러한 이름의 프로젝트를 세팅할 것이다.
add_executable(${PROJECT_NAME} src/main.cpp)
# (왼 오) 왼쪽에 적혀져있는 이름의 실행파일을 만들 것인데
# 오른쪽 파일을 컴파일해서 왼쪽의 실행파일을 만들 것이다.

