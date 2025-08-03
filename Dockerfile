# 使用轻量级的nginx镜像作为基础
FROM nginx:alpine

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 移除nginx默认的欢迎页面
RUN rm -rf ./*

# 复制我们的导航页面到nginx的html目录
COPY index.html ./

# 复制配置文件（可选，用于自定义nginx设置）
COPY nginx.conf /etc/nginx/nginx.conf

# 暴露80端口
EXPOSE 80

# 设置容器启动时运行的命令
CMD ["nginx", "-g", "daemon off;"]

# 健康检查，确保服务正常运行
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1