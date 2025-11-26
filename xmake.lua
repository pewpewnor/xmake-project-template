set_languages("c++23")
set_warnings("allextra", "pedantic", "error")
set_toolchains("clang")
set_runtimes("c++_static")
set_kind("static")

add_rules("mode.debug", "mode.release")
if is_mode("debug") then
    set_policy("build.sanitizer.address", true)
    set_policy("build.sanitizer.leak", true)
    set_policy("build.sanitizer.undefined", true)
    add_defines("DEBUG")
elseif is_mode("debug_tsan") then
    set_mode("debug")
    set_policy("build.sanitizer.thread", true)
    add_defines("DEBUG")
end

add_requireconfs("*", { configs = { shared = not is_mode("release") } })

target("project-name")
    set_kind("binary")
    add_files("src/**.cpp")
