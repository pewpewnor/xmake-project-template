add_rules("mode.debug", "mode.release")
if is_mode("debug") then
    set_policy("build.sanitizer.address", true)
    set_policy("build.sanitizer.leak", true)
    set_policy("build.sanitizer.undefined", true)
elseif is_mode("tsan") then
    set_policy("build.sanitizer.thread", true)
end

set_languages("c++23")
set_warnings("allextra", "pedantic", "error")

target("project-name")
    set_kind("binary")
    add_files("src/**.cpp")
