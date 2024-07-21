#!/system/bin/sh

# 设置特定文件类型的 SELinux 上下文
echo "狐补丁 (foxfix): 开始设置 SELinux 上下文" | busybox logger

# 遍历所有 APK 文件并设置 SELinux 上下文
for file in $(find /system -type f \( -name "*.apk" -o -name "*.vdex" -o -name "*.odex" \)); do
    echo "狐补丁 (foxfix): 设置上下文：$file" | busybox logger
    chcon -u system_u -r object_r -t system_file_t -l s0 "$file"
done

echo "狐补丁 (foxfix): SELinux 上下文设置完成" | busybox logger
