# Most mods would like it to be enable
SKIPMOUNT=false
# 是否安装模块后自动关闭，改为false，安装后不会自动勾选启用

# Set to true if you need to load system.prop
PROPFILE=true
# 是否使用common/system.prop文件

# Set to true if you need post-fs-data script
POSTFSDATA=true
# 是否使用post-fs-data脚本执行文件

# Set to true if you need late_start service script
LATESTARTSERVICE=true
# 是否在开机时候允许common/service.sh中脚本

print_modname() {
    ui_print "*****************************"
    ui_print "*                           *"
    ui_print "*      FoxTool Vol.1        *"
    ui_print "*                           *"
    ui_print "*****************************"
}

on_install() {
    ui_print "---------------------------------"
    ui_print "正在解压模块文件，请稍候..."
    unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2
    ui_print "---------------------------------"
    ui_print "文件解压完成！"
}

set_permissions() {
    ui_print "---------------------------------"
    ui_print "正在设置文件权限..."
    set_perm_recursive "$MODPATH" 0 0 0755 0644
    ui_print "---------------------------------"
    ui_print "文件权限设置完成！"
}

REPLACE="/system/product/app/MITSMClientGlobal"
