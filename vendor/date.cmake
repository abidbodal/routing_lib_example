# Download Date
ExternalProject_Add(
        date
        PREFIX "vendor/date"
        GIT_REPOSITORY "https://github.com/HowardHinnant/date.git"
        GIT_TAG e7e1482087f58913b80a20b04d5c58d9d6d90155
        TIMEOUT 10
        CMAKE_ARGS
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
        UPDATE_COMMAND ""
)

ExternalProject_Get_Property(date source_dir)
set(DATE_INCLUDE_DIR ${source_dir}/include)