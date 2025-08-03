# 🐳 Docker部署指南

## 一键部署（推荐）

### 📦 使用Docker Compose（最简单）

```bash
# 1. 克隆或下载项目
cd /Users/lx/Project/nav

# 2. 一键启动
docker-compose up -d

# 3. 查看运行状态
docker-compose ps

# 4. 访问导航页
# 打开浏览器访问：http://localhost:8080
```

### 🏗️ 使用Docker命令

```bash
# 1. 构建镜像
docker build -t docker-dashboard .

# 2. 运行容器
docker run -d \
  --name docker-dashboard \
  -p 8080:80 \
  --restart unless-stopped \
  docker-dashboard

# 3. 查看日志
docker logs docker-dashboard

# 4. 访问导航页
# 打开浏览器访问：http://localhost:8080
```

## 📋 管理命令

### 查看运行状态
```bash
docker-compose ps              # Compose方式
docker ps                     # Docker方式
```

### 查看日志
```bash
docker-compose logs -f        # 实时查看日志
docker logs -f docker-dashboard
```

### 停止服务
```bash
docker-compose down           # 停止并删除容器
docker stop docker-dashboard  # 停止容器
```

### 重启服务
```bash
docker-compose restart
docker restart docker-dashboard
```

### 更新服务
```bash
# 1. 停止当前服务
docker-compose down

# 2. 重新构建并启动
docker-compose up -d --build
```

## 🔧 自定义配置

### 修改端口
编辑 `docker-compose.yml`，修改端口映射：

```yaml
ports:
  - "你想用的端口:80"  # 例如 "3000:80"
```

### 修改服务配置

#### 方法1：挂载配置文件（推荐）
```yaml
# 在docker-compose.yml中添加
volumes:
  - ./config.json:/usr/share/nginx/html/config.json
```

#### 方法2：重建镜像
1. 修改 `index.html` 中的服务配置
2. 重新构建镜像：
```bash
docker-compose up -d --build
```

### 环境变量配置
```yaml
# 在docker-compose.yml中添加
environment:
  - TZ=Asia/Shanghai
  - CUSTOM_TITLE=我的导航页
```

## 🌐 网络配置

### 局域网访问
```bash
# 绑定到所有网络接口
ports:
  - "0.0.0.0:8080:80"
```

### 反向代理配置（Nginx）
```nginx
server {
    listen 80;
    server_name your-domain.com;
    
    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## 📊 性能优化

### 资源限制
当前配置已设置：
- 内存限制：128MB（实际使用约20-30MB）
- CPU：无限制（可根据需要调整）

### 健康检查
自动检测服务状态，异常时重启：
```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost/"]
  interval: 30s
  timeout: 10s
  retries: 3
```

## 🔍 故障排查

### 端口被占用
```bash
# 查看端口占用
lsof -i :8080

# 修改端口或停止占用程序
```

### 容器启动失败
```bash
# 查看详细日志
docker-compose logs

# 进入容器调试
docker-compose exec dashboard sh
```

### 防火墙问题
```bash
# Ubuntu/Debian
sudo ufw allow 8080

# CentOS/RHEL
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

## 🚀 高级用法

### 多环境部署
```yaml
# docker-compose.prod.yml
version: '3.8'
services:
  dashboard:
    build: .
    ports:
      - "80:80"
    environment:
      - TZ=Asia/Shanghai
    restart: unless-stopped
```

### 使用预构建镜像
```bash
# 拉取并运行（未来会上传到Docker Hub）
docker run -d -p 8080:80 --name dashboard your-username/docker-dashboard:latest
```

### 数据持久化
```yaml
# 挂载配置文件目录
volumes:
  - ./config:/usr/share/nginx/html/config
  - ./logs:/var/log/nginx
```

## 🧹 清理资源

### 清理无用镜像
```bash
docker image prune -a  # 清理所有无用镜像
docker system prune    # 清理所有无用资源
```

### 完全卸载
```bash
docker-compose down --volumes --remove-orphans
docker rmi docker-dashboard
```

## 📱 一键脚本

### 部署脚本 `deploy.sh`
```bash
#!/bin/bash
echo "🚀 开始部署Docker导航页..."

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ 请先安装Docker"
    exit 1
fi

# 检查Docker Compose是否安装
if ! command -v docker-compose &> /dev/null; then
    echo "❌ 请先安装Docker Compose"
    exit 1
fi

# 启动服务
docker-compose up -d

echo "✅ 部署完成！"
echo "🌐 访问地址：http://localhost:8080"
echo "📊 查看状态：docker-compose ps"
echo "📋 查看日志：docker-compose logs -f"
```

使用方法：
```bash
chmod +x deploy.sh
./deploy.sh
```