set_languages("c++23")
set_warnings("allextra", "pedantic", "error")
set_toolchains("clang")
set_runtimes("c++_static")
set_kind("shared")

add_rules("mode.debug", "mode.tsan", "mode.release")
if is_mode("debug") then
	set_policy("build.sanitizer.address", true)
	set_policy("build.sanitizer.undefined", true)
	set_policy("build.sanitizer.leak", true)
    add_defines("DEBUG")
elseif not is_mode("release") then
    add_defines("DEBUG")
else
    set_kind("static")
end

add_requireconfs("*", { configs = { shared = not is_mode("release") } })

rule("build-target")
    if is_mode("release") then
        on_load(function(target)
            target:set("policy", "build.optimization.lto", true)
        end)
    end

target("project-name")
    set_kind("binary")
    add_files("src/**.cpp")
