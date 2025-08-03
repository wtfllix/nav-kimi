# 🚀 个人数字仪表盘

## 📍 在线访问
**访问地址**: https://[你的用户名].github.io/[你的仓库名]/

## 🎯 功能特色
- ✨ **专业仪表盘布局**：左侧分类 + 右侧服务网格
- 🔍 **智能搜索**：支持名称和描述实时搜索
- ⭐ **个人收藏**：收藏夹功能，快速访问常用服务
- 📋 **使用历史**：自动记录最近使用的服务
- 📱 **完美响应式**：手机、平板、电脑自适应
- 🌙 **深色主题**：护眼设计，适合长时间使用

## 🛠️ 技术栈
- **前端**: HTML5 + CSS3 + ES6 (单文件架构)
- **图标**: Font Awesome 6 图标库
- **部署**: GitHub Pages + GitHub Actions (零成本)
- **构建**: Docker (可选本地部署)

## 🚀 一键部署（推荐GitHub Pages）

### 方法1：GitHub Pages（免费，推荐）
1. **Fork本项目** 到你的GitHub账户
2. **启用Pages**:
   - 进入仓库 Settings → Pages
   - Source 选择 GitHub Actions
3. **修改配置**:
   - 编辑 `personal-dashboard.html` 中的服务列表
   - 推送到 `main` 分支即可自动部署

### 方法2：本地Docker部署
```bash
# 克隆项目
git clone https://github.com/[你的用户名]/[你的仓库].git
cd docker-dashboard

# 一键启动
docker-compose up -d

# 访问 http://localhost:8080
```

## 🎨 个性化配置

### 修改服务列表
编辑 `personal-dashboard.html` 第120行开始的配置：

```javascript
const services = {
    monitoring: [
        {
            name: "你的服务名",
            url: "http://localhost:端口",
            icon: "fas fa-图标",
            description: "服务描述"
        }
    ]
}
```

### 常用图标参考
- `fas fa-server` - 服务器
- `fas fa-chart-line` - 监控
- `fas fa-play-circle` - 媒体
- `fas fa-cloud` - 云存储
- `fas fa-code` - 开发工具

## 📁 文件结构
```
docker-dashboard/
├── 📄 personal-dashboard.html    # 主页面（推荐）
├── 📄 index.html                 # 简单版本
├── 🐳 docker-compose.yml         # Docker部署
├── 🏗️ Dockerfile                 # 镜像构建
├── ⚙️ .github/workflows/         # GitHub Actions自动部署
└── 📖 README.md                  # 本说明文档
```

## 🔧 高级配置

### GitHub Actions自动部署
- **触发条件**: 推送到main分支
- **部署时间**: 约1-2分钟
- **访问地址**: `https://[用户名].github.io/[仓库名]/`

### 自定义域名（可选）
1. 在仓库设置中添加自定义域名
2. 配置DNS指向GitHub Pages

## 📊 使用技巧

### 键盘快捷键
- **`/`**: 快速聚焦搜索框
- **`ESC`**: 清空搜索
- **分类切换**: 点击左侧分类标签

### 使用建议
- **服务分组**: 按监控/媒体/存储/工具分类
- **收藏功能**: 把常用服务加入收藏夹
- **搜索技巧**: 支持服务名和描述模糊匹配

## 🔄 自动更新
- **GitHub Actions**: 每次提交自动部署
- **Docker镜像**: 自动构建多平台镜像
- **健康检查**: 自动验证部署状态

## 🎪 效果预览

### 桌面版
![桌面预览](桌面预览图片地址)

### 手机版
![手机预览](手机预览图片地址)

## 📞 技术支持
- **问题反馈**: 通过GitHub Issues
- **功能建议**: 欢迎Pull Request
- **个性化需求**: 可以Fork后自定义

---

## 🎯 下一步计划
- [ ] 添加暗色/亮色主题切换
- [ ] 集成天气API
- [ ] 添加服务状态监控
- [ ] 支持配置文件外部化
- [ ] 添加多语言支持

**🌟 给项目点个Star支持一下吧！**